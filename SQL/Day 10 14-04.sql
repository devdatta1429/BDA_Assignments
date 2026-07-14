## find all products where unit_price < recorded level 
-- show product name, stock  , how many units shoulld they have

use northwind;
show tables ;

select | from order_details;
select | from products;

with high as(
		select product_name,id,reorder_level
        from products)
select  distinct p.product_name,od.quantity,(od.quantity - p.reorder_level) as units_short
from high p join order_details od on p.id=od.product_id
where p.reorder_level > od.unit_price 
order by product_name;

## ====================================================================================================
-- compute the total revnue and compute each month .
with total_revenue as(
		select od.order_id,(quantity|unit_price) as TT
		from order_details od)

,month_revenue as (
		select month(o.order_date) as months,sum(tr.tt) as month_revenue
		from total_revenue tr join orders o on o.id = tr.order_id 
		group by months)

select months,month_revenue,(
						select sum(month_revenue)
                        from month_revenue) as total_revenue
FROM month_revenue
ORDER BY months;

select | from orders;
select | from order_details;
select | from products;

## ====================================================================================================
-- 
use new_one;
with emp as(
		select employee_id,first_name,last_name,salary,department_id
        from employees)
select (select count(|) as no_of_emp from emp) as no_emp,
		  (select avg(salary) as avg_sal from emp) as avg_sal,
          (select sum(salary) as tol_sal from emp) sum_sal;


## ====================================================================================================
WITH RECURSIVE rec AS (
    -- Start date (min date from orders)
    SELECT MIN(DATE(order_date)) AS dt
    FROM orders

    UNION ALL

    -- Generate next dates
    SELECT dt + INTERVAL 1 DAY
    FROM rec
    WHERE dt < (SELECT MAX(DATE(order_date)) FROM orders)
),

order_day AS (
    SELECT DATE(o.order_date) AS od_da, COUNT(|) AS no_od_od
    FROM order_details od
    join orders o
    on o.id=od.id
    WHERE YEAR(order_date) = 2006
    GROUP BY DATE(order_date)
)

SELECT 
    r.dt,
    DAYNAME(r.dt) AS day_name,
    COALESCE(od.no_od_od, 0) AS total_orders
FROM rec r
LEFT JOIN order_day od 
    ON r.dt = od.od_da
ORDER BY total_orders desc;

## ====================================================================================================
## ====================================================================================================
## ===================================  WINOW FUNCTION  =================================================
## ====================================================================================================
## ====================================================================================================


## =================================== Partiton By ============================================
use movie_db;
select * from imdb_names;
use new_one;

select employee_id, first_name, department_id, salary, sum(salary) over (partition by department_id) as_dept
from employees;

select employee_id,first_name,department_id,salary , avg(salary) over (partition by department_id) as_dept
from employees;

select employee_id,first_name,department_id,salary , max(salary) over (partition by department_id) as_dept
from employees;

select employee_id,first_name,department_id,salary , min(salary) over (partition by department_id) as_dept
from employees;

## =================================== order by =====================================================

select employee_id,first_name,department_id,salary, min(salary) over (order by salary) as_dept
from employees;

select employee_id,first_name,department_id,salary, count(*) over (partition by department_id order by salary) as_dept
from employees;

select employee_id,first_name,department_id,salary,row_number() over() as_row 
from employees;
## --------------------------------------------------------------------------------------------------------------------------------------------------------
select employee_id,first_name,department_id,salary,row_number() over() as_row 
from employees
limit 5;

select employee_id,first_name,department_id,salary,row_number() over(partition by department_id) as_row 
from employees;

with second_hi as (
	select employee_id,first_name,department_id,salary, row_number() over (partition by department_id order by salary desc ) as_salry
    from employees)
select * from second_hi where as_salry<=2;

## ====================================================================================================
-- where you need to find newly or latest joined employee in ech departement
select e.*,e.hire_date as d
from employees e
order by d desc;

with latest_join as(
		select employee_id,first_name,department_id,hire_date,row_number() over (partition by department_id order by hire_date desc) as_latest
        from employees)
select first_name,department_id, hire_date,as_latest
from latest_join
where as_latest=1;


## ===================================    Remove     ==================================================

## employee + department - duplicate () read


with latest_join1 as(
		select employee_id,first_name,department_id,row_number() over (partition by first_name,department_id) as_latest1
        from employees)
select first_name,department_id, as_latest1
from latest_join1;


## ===============================       use movie_db         =================================================
use movie_db;

select
	row_number () over (order by r.averagerating desc ) as row_num,
    t.primaryTitle as Title,
    r.averageRating as rating
from imdb_titles t join imdb_ratings r on t.tconst = r.tconst
where t.titleType = 'Movie' and r.NumVotes >= 100000
limit 10; 

with top1 as(
	select
		row_number () over (partition by t.genres order by r.averagerating desc ) as row_num,
		t.primaryTitle as Title,
		r.averageRating as rating
	from imdb_titles t join imdb_ratings r on t.tconst = r.tconst
	where t.titleType = 'Movie' and r.averagerating >= 8.8
	limit 10)
select * 
from top1 
where row_num = 1; 


## ====================================================================================================
use new_one;
select employee_id,first_name,department_id,salary,
	row_number () over (partition by department_id  order by salary desc ) as_row_num,
    rank() over (partition by department_id  order by salary desc ) as_rank,
    dense_rank() over (partition by department_id  order by salary desc ) as_dense_rank
from employees; 


## ====================================================================================================
-- -- rank emp1 based on their salary - high to low

select employee_id,first_name,department_id,salary,
rank() over(order by salary desc) as_rank
from employees
limit 5;

#========================    to 3 unique salaried emp   ==================
SET GLOBAL wait_timeout = 28800;
SET GLOBAL interactive_timeout = 28800;
SET GLOBAL max_execution_time = 30000; -- Sets a 30-second limit

# rank the movies inside genres
use movie_db;

WITH movie_rank AS (
    SELECT 
        t.genres,
        t.primaryTitle,
        r.averageRating,
        RANK() OVER (
            PARTITION BY t.genres 
            ORDER BY r.averageRating DESC
        ) AS genre_each
    FROM imdb_titles t 
    INNER JOIN imdb_ratings r
        ON t.tconst = r.tconst
)
SELECT *
FROM movie_rank
WHERE genre_each = 1;



## ====================================================================================================
use new_one;
select employee_id, first_name,department_id,salary, last_value(salary) over (partition by department_id) as_last_value
from employees;

select employee_id, first_name,department_id,salary, first_value(salary) over (partition by department_id order by salary) as_last_value
from employees;

select employee_id, first_name,department_id,salary, lead(salary) over (partition by department_id order by salary) as_lead_value
from employees;

select employee_id, first_name,department_id,salary, lag(salary) over (partition by department_id order by salary) as_lag_value
from employees;

with diff as(
				select employee_id, first_name,department_id,salary, lag(salary) over (partition by department_id order by salary) as_last_value
				from employees
				)
select salary,as_last_value,salary-as_last_value as differernce
from diff;
