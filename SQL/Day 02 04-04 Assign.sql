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


