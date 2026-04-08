use db;
-- ---------------------------------------------------------------------------
# 1.Create a table students_basic with the following columns:
-- ○	id (integer)
-- ○	name (varchar 50)
-- ○	age (integer)

create table students(
id int,
stu_name varchar(50),
age int
);

-- ---------------------------------------------------------------------------
# 2. Insert 5 records into students_basic.
insert into students values
(1,"dev",23),
(2,"arv",20),
(3,"sujal",22),
(4,"chaitanya",28),
(5,"soham",50);

-- ---------------------------------------------------------------------------
# 3. Select all records from the table.
select * from students;

-- --------------------------------------------------------------------------- 
# 4.	Create a table products_basic with:
-- ○	product_id (int)
-- ○	product_name (varchar 100)
-- ○	price (decimal 8,2)

create table product_basic(
product_id int,
product_name varchar(100),
price decimal(8,2));
-- ---------------------------------------------------------------------------
# 5.Insert 3 products and display them. 
insert into product_basic values
(1,"TV",1000.00),(2,"Laptop",20000.00),(3,"Console",5000.00);

-- ---------------------------------------------------------------------------
#6.	Create a table employees_basic with:
-- ○	emp_id (int)
-- ○	emp_name (varchar 50)
-- ○	joining_date (date)

create table employee_ba(
emp_id int,
emp_name varchar(50),
doj date);

-- ---------------------------------------------------------------------------
#7.	Insert at least 4 employees and display only names and joining dates.
insert into employee_ba values
(1,"dev",'2020-01-01'),
(2,"arv",'2020-01-02'),
(3,"sujal",'2020-01-03'),
(4,"chaitanya",'2020-01-04');

select * from employee_ba;

-- ---------------------------------------------------------------------------
#8.	Create a table using CHAR and VARCHAR and insert values to observe differences.

create table observe(
name1 char(10),
name2 varchar(10)
);

insert into observe values ("devdatta","devdatta"),("sujal","chaitanya");
select * from observe;

-- ---------------------------------------------------------------------------
#9.	Create table flags with a BOOLEAN column. Insert TRUE/FALSE values and display results.
create table flags(
value1 boolean);

insert into flags values(True),(false),(True);
select * from flags;

-- ---------------------------------------------------------------------------
#10.	Create a table numbers_test using TINYINT, SMALLINT, and BIGINT. Insert sample values.
create table numbers_test(
	num_1 tinyint,          # 0 - 255
    num_2 smallint,         # 0 - 65,535
    num_3 bigint            # 0 - 18,446,744,073,709,551,615
);

insert into numbers_test values(1281,64676,273563);
# Error Code: 1264. Out of range value for column 'num_1' at row 1	0.000 sec
insert into numbers_test values(12,60676,273563);

##################################################################################
## SECTION B: INTERMEDIATE LEVEL
##################################################################################
#11.	Create a table students with:
#●	id (int primary key)
#●	name (varchar 100 not null)
#●	marks (float)
#●	grade (char 2)

create table students1(
id int primary key,
name1 varchar(100) not null,
marks  float,
grade char(2)
);

-- ---------------------------------------------------------------------------
# 12.	Insert at least 6 records with varying marks.
insert into students1 values(1,"dev",80.00,"A");
insert into students1 values(2,"sujal",78.00,"A");
insert into students1 values(3,"chaitu",70.00,"c");
insert into students1 values(4,"saurabh",90.00,"B");
insert into students1 values(5,"soham",77.00,"A");
insert into students1 values(6,"rupi",74.00,"A");

select *  from students1;

-- ---------------------------------------------------------------------------
# 13.	Select students scoring more than 75 marks.
select * 
from students1
where marks > 75;

-- ---------------------------------------------------------------------------
# 14.	Create a table orders with:
#	order_id (int)
#●	order_date (datetime)
#●	amount (decimal 10,2)

create table orders(
order_id int,
order_date datetime,
amount decimal(10,2)
);

-- ---------------------------------------------------------------------------
# 15.	Insert records with different timestamps and query only date part.
insert into orders values(100, now(), 100000.00);
insert into orders values(200, now(), 200000.00);
insert into orders values(300, now(), 300000.00);

select order_date from orders;

-- ---------------------------------------------------------------------------
#16.	Create a table users with ENUM for roles ("admin", "user", "guest"). Insert records.
create table users1(
e_name varchar(10),
roles ENUM("admin","user","guest")
);

insert into users1 values("arv","user");
insert into users1 values("dev","admin");

-- ---------------------------------------------------------------------------
#17.	Try inserting a value outside ENUM and observe behavior.

insert into users1 values("dev","gamer");
# 	Error Code: 1265. Data truncated for column 'roles' at row 1	0.000 sec

-- ---------------------------------------------------------------------------
#18.	Create a table binary_test using BLOB and TEXT. Insert sample data.
create table binary_test(
content text,
photo blob);

insert into binary_test values("You just need to remove the duplicate entry. Here is the corrected code",
load_file('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/image.png')
);

select * from binary_test;

-- ---------------------------------------------------------------------------
#19.	Create a table salary_test using DECIMAL and FLOAT. Insert same values and compare.

create table salary_test(
one1 decimal,
one2 float);

insert into salary_test values(12.1213212, 12.1213212);
select * from salary_test;

-- ---------------------------------------------------------------------------
#20.	Write a query to select records where amount is between 1000 and 5000.
select * 
from orders
where amount between 1000 and 5000;

-- ---------------------------------------------------------------------------
#SECTION C: ADVANCED LEVEL
-- ---------------------------------------------------------------------------
#21.	Create a table complex_types with:
#●	id (int)
#●	json_data (JSON)

create table complex_types(
id int,
json_data json);

-- ---------------------------------------------------------------------------
#22.	Insert structured JSON data and query specific keys.
insert into complex_types values
(1,'{"sub":["maths","science"]}'),
(2,'{"laptop":["asus","lenovo"]}');

select json_data ->> '$.sub[0]' from complex_types;

-- ---------------------------------------------------------------------------
#23.	Create a table date_test with DATE, TIME, DATETIME, TIMESTAMP. Insert values and compare outputs.
# Create a table date_test with DATE, TIME, DATETIME, TIMESTAMP. Insert values and compare outputs. 
create table date_test(
    d date,
    t time,
    dt datetime,
    ts timestamp 
);
insert into date_test values('2026-02-25','10:10:10','2026-03-30 11:11:11',now());
select * from date_test;

-- 24. Create a table auto_test with AUTO_INCREMENT primary key. Insert records without specifying id. 
create table auto_test(
    id int auto_increment primary key,
    name varchar(10)
);
insert into auto_test(name) values ('Sujal'),('Sanket');
select * from auto_test;

-- 25. Create a table precision_test and test overflow in DECIMAL. 
create table precision_test(
    d decimal(5,2)
);
insert into precision_test values(999.99);
insert into precision_test values(9999.99);        # (overflow) Error Code: 1264. Out of range value for column 'd' at row 1

-- 26. Create a table string_test and test max length for VARCHAR.
create table string_test(
    str varchar(5)
); 
insert into string_test values('Sujal');
insert into string_test values('SujalG');        # Error Code: 1406. Data too long for column 'str' at row 1

-- 27. Create a table null_test with NOT NULL constraint. Try inserting NULL values.
create table null_test(
    id int not null
);
insert into null_test values(1);
insert into null_test values(null);        # Error Code: 1048. Column 'id' cannot be null

-- 28.Create a table default_test with DEFAULT values and test insert behavior.
create table default_test(
    name varchar(10),
    course varchar(10) default 'BDA'
);
insert into default_test(name) values('Sujal');
insert into default_test(name) values('Sanket');
select * from default_test;

-- 29. Create a table mixed_types combining INT, FLOAT, VARCHAR, DATE, and BOOLEAN. Insert and query based on multiple conditions.
create table mixed_types(
    prod_id int,
    prod_name varchar(10),
    prod_price float,
    prod_pur_date date,
    prod_ava boolean
);
insert into mixed_types values(101,'Laptop',500.00,'2026-04-06',true);
select * from mixed_types;

-- 30. Create a table where incorrect datatype insertion is attempted (e.g., string in INT). Observe and document behavior.
create table incorrect(
    id int,
    name varchar(10)
);
insert into incorrect values(1,'Sujal');
insert into incorrect values(2,2);
insert into incorrect values('ABC',3);        # Error Code: 1366. Incorrect integer value: 'ABC' for column 'id' at row 1
select * from incorrect;

