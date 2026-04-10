use northwind;
use new_one;

select 5 = null;
select 'ab' = null;
select true = null;
select null = null;
select '' and null;
select concat('hii',null);

## ============================ FUNCTIONS (Pre - Defined)=================================================
##                                       |
## ---------------------------------------------------------
##     |           |           |            |              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                     |
## aggregate    string      window        maths         control


## ==================== Count =================================================

select * from orders;
select count(distinct(employee_id)) from orders;

-- find no. od customer who have ship_city is 'new york'
select count(distinct customer_id)
from orders
where ship_city="new york";


## ==================== Sum =================================================

select sum(shipping_fee)
from orders;

use new_one;
select sum(salary)
from employees;


select distinct paid_date
from orders
where paid_date is not null
order by paid_date desc;

select sum(quantity*unit_price) as Total_revenue
from order_details;

## ==================== Avg =================================================
select avg(salary) 
from new_one.employees;

select avg (unit_price) as avg_unit
from northwind.order_details;

select avg(quantity) as avg_quan
from northwind.order_details;

## ==================== Max and Min =================================================

select min(unit_price) as min_unit, max(unit_price) as max_unit
from northwind.order_details;


## ============================ Wild Card====================================
## ============================ Wild Card====================================
## ============================ Wild Card====================================
## ============================ Wild Card====================================

create database wildcard;
use wildcard;

CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4,2)
);
INSERT INTO salesman VALUES
(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),     -- N + 4th letter condition
(5003,'Pit Alex','London',0.11),
(5004,'Mc Lyon','Paris',0.14),
(5005,'Paul Adam','Rome',0.13),
(5006,'Lauson Hen','San Jose',0.12),
(5007,'Nolan Dale','Rome',0.14),      -- starts with N
(5008,'Albert King','London',0.10),   -- A–L range
(5009,'Kevin Ross','Paris',0.12),     -- K range
(5010,'Zara Khan','Dubai',0.16);      -- outside range


CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);
INSERT INTO customer VALUES
(3001,'Brad Guzan','London',100,5005),   -- starts with B
(3002,'Nick Rimando','New York',200,5001), -- ends with n
(3003,'Jozy Altidore','Moscow',NULL,5007), -- NULL grade
(3004,'Fabian Johnson','Paris',300,5006),  -- ends with n
(3005,'Graham Zusi','California',200,5002),
(3006,'Julian Green','London',NULL,5003),  -- ends with n + NULL
(3007,'Brian Ching','New York',100,5001),
(3008,'Clint Dempsey','London',300,5003),
(3009,'Benny Feilhaber','Paris',200,5002), -- starts with B
(3010,'Aron Johansson','Rome',NULL,5005);  -- ends with n


CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);
INSERT INTO orders VALUES
(70001,150.50,'2012-10-05',3005,5002),
(70002,270.65,'2012-09-10',3001,5005),
(70003,65.26,'2012-10-05',3002,5001),
(70004,110.50,'2012-08-17',3009,5003),
(70005,2400.60,'2012-07-27',3007,5001), -- valid
(70006,5760.00,'2012-09-10',3002,5001),
(70007,948.50,'2012-09-10',3005,5002), -- excluded
(70008,1983.43,'2012-10-10',3008,5003),-- excluded
(70009,3000.00,'2012-08-17',3003,5007),-- valid
(70010,4000.00,'2012-10-10',3004,5006);-- valid


CREATE TABLE employees (
    emp_idno INT PRIMARY KEY,
    emp_fname VARCHAR(50),
    emp_lname VARCHAR(50),
    emp_dept VARCHAR(50)
);

INSERT INTO employees VALUES
(1,'John','Doe','IT'),       -- starts with D
(2,'Sara','Davis','HR'),     -- starts with D
(3,'Mike','Smith','Sales'),
(4,'Neha','Desai','Finance'),-- starts with D
(5,'Amit','Kumar','IT'),
(6,'Riya','Dutta','HR'),     -- starts with D
(7,'David','Brown','Sales');


CREATE TABLE test_table (
    col1 VARCHAR(50)
);
INSERT INTO test_table VALUES
('abc_def'),        -- underscore
('abcdef'),
('abc/def'),        -- slash
('abc_def/ghi'),    -- underscore + slash
('abc%def'),        -- percent
('plain_text'),     -- underscore
('_start'),         -- underscore
('end_'),           -- underscore
('slash/only'),
('percent%only'),
('mix_%_/data');    -- combo

show tables;

## ===========================================================================
-- 1. write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City. Return salesman_id, name, city, commission.
select salesman_id , name , city , commission
from salesman
where city = 'paris' or city ='rome';

-- 2.write a SQL query to find the details of the salespeople who come from either 'Paris' or 'Rome'. Return salesman_id, name, city, commission.

-- 3. write a SQL query to find the details of those salespeople who live in cities other than Paris and Rome. Return salesman_id, name, city, commission.  
-- 4. write a SQL query to retrieve the details of all customers whose ID belongs to any of the values 3007, 3008 or 3009. Return customer_id, cust_name, city, grade, and salesman_id.  
-- 5. write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 (begin and end values are included). Return salesman_id, name, city, and commission.  
-- 6. write a SQL query to select orders between 500 and 4000 (begin and end values are included). Exclude orders amount 948.50 and 1983.43. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id. 
-- 7. write a SQL query to retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission. 
-- 8.write a SQL query to find the details of all salespeople except those whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission.  
-- 9.write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'. Return customer_id, cust_name, city, grade, salesman_id.. 
-- 10. write a SQL query to find the details of the customers whose names end with the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.
-- 11. write a SQL query to find the details of those salespeople whose names begin with ‘N’ and the fourth character is 'l'. Rests may be any character. Return salesman_id, name, city, commission. 
-- 12.write a SQL query to find those rows where col1 contains the escape character underscore ( _ ). Return col1.
-- 13. write a SQL query to identify those rows where col1 does not contain the escape character underscore ( _ ). Return col1.
-- 14.write a SQL query to find rows in which col1 contains the forward slash character ( / ). Return col1.
-- 15. write a SQL query to identify those rows where col1 does not contain the forward slash character ( / ). Return col1.
-- 16. write a SQL query to find those rows where col1 contains the string ( _/ ). Return col1.
-- 17. write a SQL query to find those rows where col1 does not contain the string ( _/ ). Return col1.
-- 18. write a SQL query to find those rows where col1 contains the character percent ( % ). Return col1.
-- 19. write a SQL query to find those rows where col1 does not contain the character percent ( % ). Return col1.
-- 20. write a SQL query to find all those customers who does not have any grade. Return customer_id, cust_name, city, grade, salesman_id.
-- 21. write a SQL query to locate all customers with a grade value. Return customer_id, cust_name,city, grade, salesman_id.
-- 22. write a SQL query to locate the employees whose last name begins with the letter 'D'. Return emp_idno, emp_fname, emp_lname and emp_dept. 

## ============================================== Group By ================================================================
-- the attribute that is present in the group clause only those attribute should mention in select clause.
use new_one;
select DEPARTMENT_ID,count(department_id)
from employees
group by department_id;

select salary,count(*) as count1
from employees
where salary = 12000
group by salary
order by salary desc;

## ==============================================================================
select category, count(*) number_of_product
from products
where category = 'Beverages'
group by category
order by number_of_product;


##===============================================================================
# find the no of oders placed by each customers 

select customer_id,count(*) as count
from orders
group by customer_id;


# find the toatal revenue for each product
select product_id,sum(unit_price*quantity) as revenue
from order_details
group by product_id
order by revenue desc;

select  department_id , count(*) as num_emp
from employees
where year(hire_date) < 1988
group by  department_id;

-- ----------------------------------------------------------------------------------------------------------------
# find max slary in each department

select department_id, max(salary) as max_salary
from employees
group by department_id
order by max_salary desc;

-- ---------------------------------------------
# find min and max salary each job_id where department _id = 80
select department_id,min(salary) as min_sal,max(salary) as max_sal
from employees
group by department_id
order by min_sal;

select  job_title,count(*)
from jobs
group by job_title;


# =====================================================================================

select manager_id , count(*) as no_of_mgr
from employees
group by manager_id
having no_of_mgr >= 5
order by no_of_mgr desc;

## =================================================================================
## no of customers who have placed more than 5 orders

select * from orders;
select customer_id,count(*) as no_of_orders
from orders
group by customer_id
having no_of_orders >=5
order by no_of_orders desc;

# ========================================================================
## find the shippper who have shipped the more than 1000 orders in year 1997
select * from orders;
select shipper_id,count(*) as no_count
from orders
where year(shipped_date)='2006'
group by shipper_id
having no_count>10;

# ========================================================================
## find the department who's total salry exceed 50k
select department_id,sum(salary) as total_sal
from employees
group by department_id
having total_sal > 50000;

# ========================================================================
# find the department who's avg salarys is between 5000 and 10000

select department_id,avg(salary) as avg_sal
from employees
group by department_id
having avg_sal between 5000 and 10000;

# ========================================================================
# find the department where differnce between min salary and max salary is greater than 5000

select department_id, min(salary) as min_sal,max(salary) as max_sal
from employees
group by department_id
having max_sal-min_sal>5000;


# ========================================================================
# 
select
	case
		when salary < 5000 then 'low range sal'
        when salary < 10000 then 'mid range sal'
        when salary < 50000 then 'high range sal'
        
	end as salary_band,
    count(*) as no_of, min(salary) as min_sal, max(salary) as max_sal
    from employees
    group by 
		case
		when salary < 5000 then 'low range sal'
        when salary < 10000 then 'mid range sal'
        when salary < 50000 then 'high range sal'
        else 'High'
	end 
    order by salary_band desc;

    
--     hi dev,
--     you are so inteeligent and good guy......but you never bring anything to eat 
--     
--     so do get it
--     
--     thenkssss
--     sweetie 
    
# ========================================================================================================

select upper(first_name) from employees;
select lower(first_name) from employees;



-- sub string
select first_name,substring(first_name ,1,3) from employees;

 -- left
 select first_name,left(first_name,2) from employees;
 
 -- right
 select first_name,right(first_name,2) from employees;
 
 -- replace
  select first_name,replace(phone_number,'.','-') from employees;