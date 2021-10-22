
--To get sales, profit, store, city, location
--Hence we need:
create table sales_full as
	select 
	sc."Date",
	sc.sale_id,
	sc.units,
	sc.store_id,
	sc.product_id,
	pc.product_name,
	pc.product_category,
	pc.product_price as sales,
	pc.product_cost as costs,
	sc2.store_name,
	sc2.store_city,
	sc2.store_location
	from sales_csv sc 
	left join products_csv pc 
	on sc.product_id = pc.product_id 
	left join stores_csv sc2 
	on sc.store_id = sc2.store_id 
	where sc."Date" > '2017-08-31'
	order by sc."Date" asc 

--high sales rank by store, take 3 best stores
--3 best based on highest sales
select * from sales_full sf
create table sales_qty_bystore as
	select store_id,
	store_name, 
	product_id,
	product_name, 
	sum(units) as sales_qty
	from sales_full 
	group by product_id, store_id, store_name, product_name 
	order by product_id, sales_qty desc

create table high_sales_rank as
select *
from (select *,
rank() over (partition by product_id order by sales_qty desc)
from sales_qty_bystore) as rank_high_salesqty 
where rank <= 3 

create table alt_store_detail as
	select product_id,
	product_name,
	array_agg(store_id) as alt_store_id,
	array_agg(store_name) as alt_store_name
	from high_sales_rank
	group by product_id, product_name
	order by product_id

--low sales by store
create table low_sales as
	select 
	store_id,
	store_name,
	product_id,
	product_name,
	sum(units) as sales_qty
	from sales_full 
	group by store_id, product_id, store_name, product_name 
	order by store_id, sales_qty asc
	
create table low_sales_bystore as
	select *
	from (select *,
	rank() over (partition by store_id order by sales_qty asc)
	from low_sales) as rank_high_sales 
	where rank <= 10

create table low_sales_rank as
	select * from low_sales_bystore 
	where "rank" <= 10
	
--final table: alternative store for low-selling products
create table alternative_store as 
	select 
	lsr.product_id,
	lsr.product_name,
	lsr.store_id,
	lsr.store_name,
	asd.alt_store_id,
	asd.alt_store_name
	from low_sales_rank lsr 
	left join alt_store_detail asd 
	on lsr.product_id = asd.product_id
