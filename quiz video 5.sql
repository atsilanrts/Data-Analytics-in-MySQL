## QUIZ 5

# 1
select
	order_id,
    customer_unique_id, #di tabel olcust
    order_status,
    order_purchase_timestamp
from
	olist_orders as t1
    inner join
    olist_customers as t2
    on t1.customer_id = t2.customer_id

# 2
select
	product_category_name,
    price
from
	olist_products as t1
    inner join
    olist_order_items as t2
    on t1.product_id = t2.product_id
where
	price is not null

# 3

## first step : ambil id yg purchase 2017 aja
select
	customer_id
from
    olist_orders
where
	order_purchase_timestamp like '2017%'
    
## second step
select
count(distinct customer_unique_id) as count_customer
from
	(
	select
		*
	from
		(select customer_id, customer_unique_id from olist_customers) as t1
		left join
		(select customer_id as customer_id_2 from olist_orders where order_purchase_timestamp like '2017%') as t2
		on t1.customer_id = t2.customer_id_2
	) as t
where
	customer_id_2 is null


### note: yang cust id 2 itu yang pembelian 2017, kalo null berarti gabeli

# 4
select
	seller_id,
    review_score,
    count(1) as count_review #menghitung byk brp setiap seller
from
	(select order_id, review_score from olist_order_reviews where review_creation_date like '2018%') as order2018
	inner join
	(select order_id, seller_id from olist_order_items) as t2
    on order2018.order_id = t2.order_id
group by
	1, 2 
order by
	2 desc, 3 desc
