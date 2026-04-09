use northwind;

select * from orders;

select customer_id,order_date,payment_type,
    case payment_type
		when payment_type="Credit Card" then "payment made by card"
        when payment_type="cheque" then "payment made by cheque"
        when payment_type="Cash" then "payment made by cash"
        else "other"
	end as status_of_order
from orders;

select * from products;
    
select product_name,category,
    case category
		when category="Beverages" then "put it in drinks section"
        when category="Canned Fruit & Vegetables" then "put it in fridge"
        when category="Candy" then "put it near cash counter"
        else "to be disccuss"
	end as cat_product
from products;

select product_name,category,reorder_level,
	case
		when reorder_level between 0 and 10 then 'stop putting in the inventory'
		when reorder_level between 10  and 30 then 'making medium stock'
		when reorder_level between 50 and 100 then 'then a high stock'
		else 'to be discuss'
	end as reorder_product
from products;

#                          case
#                           |
#                           |
#        -----------------------------------------
#        |                                       |
#      single                                 searched

select product_name,standard_cost,list_price,
case 
	when standard_cost=3.00 and list_price = 3.500 then 'Dried olums'
    when standard_cost = 2.00 and list_price = 4.000 then 'Garnola'
    else 'to be discuss'
end as match_on
from products;

use northwind;

select customer_id, payment_type,status_id,paid_date, 
	case
		when payment_type is null and paid_date is null and status_id = 3 then 'stop the processing'
        when payment_type = "cash" and paid_date = 0 then 'process order'
        when payment_type is null and paid_date is null then 'stop'
	end as state_of_order
from orders;

desc orders;
select * from orders;
select * from order_details;
select * from order_details_status;

select id, paid_date,
	case 
    when payment_type is null and timestampdiff(day,order_date,now())>=30 then "overdue"
    when payment_type is null and timestampdiff(day,order_date,now())<30 then "Due soon"
    when payment_type is null then "Cleared"
    else "other"
end as payment_is_done_or_not
from orders;

# ====================================================================================
select * from purchase_orders;
-- select creation_date,expected_date,
-- case
-- 	when expecetd_date is null then "No data set"
-- 	when timestampdiff(day,expected_date, now()) <= 0 then "overdue"
--     when timestampdiff(day,expected_date, now()) <= 0 then "planned"
--     when timestampdiff(day,expected_date, now()) <= 0 then "urgent"
--     when timestampdiff(day,expected_date, now()) <= 0 then "upcoming"
--     when timestampdiff(day,)

# ====================================================================================

select 
	employee_id,
		 count(case when status_id = 2 then 1 end) as shipped_orders,
         count(case when status_id < 2 then 1 end) as pending_orders
from orders
group by employee_id;

select * from orders order by employee_id;

-- ====================================================================================
select * from products;
update products
set list_price =
	 case category
     when 'Beverages' Then list_price * 0.90
     when 'Condiments' then list_price * 0.95
     when 'Seafood' then list_price * 0.85
     else                list_price
     end 
where discontinued = 0;
-- -----------------------------------------------------------------
select 
	product_name,discontinued,
    if (discontinued = 0 , 'Discontinued', 'Available') as Status
from products;
-- -------------------------------------------------------------------
select
	id,shipping_fee,
	if (shipping_fee = 0, 'Free' , 'Paid') as shipping_type
from orders;

-- --------------------------------------------------------------------

select
	id,shipped_date,
    if (shipped_date is null, 'Not shipped','Shipped') as delivery_status
from orders;

-- ----------------------------------------------------------------------

select product_name, reorder_level,
	if(reorder_level >= 10 ,'Recorder Requied','No Recorder') As reorder_status
from products;

-- --------------------------------------------------------------------------

select id, unit_price, discount,
	if (discount > 1, unit_price * discount,0) as discount_amount
from order_details;

