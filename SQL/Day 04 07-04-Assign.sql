##==================== MySQL Data Types — Assignment ====================
# =======================================================================
##====================== SECTION 1 — BEGINNER LEVEL =====================

##----------------------------------------------------------------------------------------------
## 1 What is the difference between CHAR(10) and VARCHAR(10)? Give one real-life example for each.
create table data1(
name1 char(10),    # takes all 10 spaces
name2 varchar(10));# takes only 

insert into data1 values('devdatta','devdatta');

select * from data1;
##------------------------------------------------------------------------------------------------
## 2 Which data type would you use to store: 
## (a) a student age, (b) a product price, (c) a blog post body, (d) a yes/no flag? Write the type name only.