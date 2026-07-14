## -----------------------------------------------------------------------------------------------------------------------------------------------------------
## Section 1: Basic SQL (6 Marks) 
create table statement(
	task_id int auto_Increment primary Key,
    task_name VARCHAR (20) NOT NULL ,
    due_date DATE );

## -----------------------------------------------------------------------------------------------------------------------------------------------------------

insert into statement (task_name,due_date) values ('Data Cleaning', '2025-03-01') ,
												  ('Model Training', '2025-03-15') ;
## -----------------------------------------------------------------------------------------------------------------------------------------------------------

update statement set task_name = 'ML Training' where task_name = 'Model Training';
## -----------------------------------------------------------------------------------------------------------------------------------------------------------

select * 
from statement
where task_name like 'D%';


# =================================================================================================================
# =============================     Section 2: Work on Given Schema (classicmodels)    =================================================
# =================================================================================================================
## Q2. DDL & DML Operations (2 Marks) 

## A)
alter table products add column profit_margin DECIMAL(5,2) NOT NULL DEFAULT 0.00;
alter table products modify column profit_margin DECIMAL(5,2) NOT NULL DEFAULT 20.00;
## -----------------------------------------------------------------------------------------------------------------------------------------------------------

## B)
alter table customers add column contact_name VARCHAR(120) generated always as (CONCAT(contactFirstName, ' ',contactLastName));


# =================================================================================================================
# =================================================================================================================
## Q3.
select * from customers;
select * from orders;
select * from products;
select * from orderdetails;

select  o.orderNumber,
		CONCAT(c.contactFirstName, ' ',c.contactLastName) as customer_name,
		od.quantityOrdered as total_quantity,
        (od.quantityOrdered * od.priceEach)  as total_amount
from  customers c join orders o on c.customerNumber = o.customerNumber
				  join orderdetails od on o.orderNumber = od.orderNumber
where month(o.orderDate) = 02;

# =================================================================================================================
# =================================================================================================================
## Q4.

select o.productCode, p.productName, o.quantityOrdered as total_quantity 
from orderdetails o join products p on o.productCode = p.productCode
order by total_quantity desc
limit 5;

# =================================================================================================================
# =================================================================================================================
## Q5.


select * from products;
delimiter $$
create trigger alert
before update on products
for each row
begin
		If MSRP < buyPrice then update products set MSRP = buyPrice * 1.10;
        end if;
end
$$ delimiter ;

# =================================================================================================================
# =================================================================================================================
## Q6.

delimiter $$
create procedure get_customer_orders(in p_customer_id INT, 
									out orderNumber int,
									out orderDate date, 
									out status varchar (15),
									out total_amount int)
begin
		select od.orderNumber, o.orderDate, o.status,(quantityOrdered * priceEach) as total_amount into orderNumber, orderDate, status, total_amount
		from customers c join orders o on c.customerNumber = o.customerNumber 
						join orderdetails od on o.orderNumber = od.orderNumber
        where c.customerNumber = p_customer_id
        order by orderDate desc
        limit 1;
end $$ delimiter ;

call get_customer_orders(112, @orderNumber, @orderDate, @status, @total_amount);
select @orderNumber, @orderDate, @status, @total_amount;

# =================================================================================================================
# =================================================================================================================
## Q7.

delimiter $$ 
create function fn_total_quantity(p_orderNumber INT)
returns int
deterministic
begin
		declare value1 int;
        select sum (quantityOrdered) into value1
        from orderdetails 
        where orderNumber = p_orderNumber
        group by orderNumber;
        return value1;
end;; $$ delimiter ;
        
drop function fn_total_quantity;
    
SELECT fn_total_quantity(10101) 
FROM orders
where orderNumber = 10101;
        
SELECT * FROM payments;
 
 # =================================================================================================================
# =================================================================================================================
## Q8.

with  total_payments as(
		select c.customerNumber,CONCAT(c.contactFirstName, ' ',c.contactLastName) as customer_name,
        p.amount as total_payment,
        rank() over (order by amount desc) as_rank
        from customers c join payments p on c.customerNumber= p.customerNumber
)
select * 
from total_payments
where as_rank=1;
    
 # =================================================================================================================
# =================================================================================================================
## Q9.

select c.customerNumber,o.orderNumber ,o.orderDate, CONCAT(c.contactFirstName, ' ',c.contactLastName) as customer_name,
sum(od.quantityOrdered) as total_products
from orders o join customers c on c.customerNumber = o.customerNumber
				join orderdetails od on od.orderNumber= o.orderNumber
group by c.customerNumber
having total_products > 100 
Order by orderDate;
