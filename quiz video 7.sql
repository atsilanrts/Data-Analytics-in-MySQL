## QUIZ 7

# 1
select
	payment_type,
    replace(payment_type, '_', ' ') as paymenttype_fix
from
	olist_order_payments
    
# 2
## yg diminta itu order id nya
## step 1
select
	order_id,
	order_delivered_customer_timestamp
from
	olist_orders
where
	substr(order_delivered_customer_timestamp, 9, 2) = '01'
# note : ini dapet order yg tanggal 1

## CARA KEDUA
select
	order_id,
	order_delivered_customer_timestamp
from
	olist_orders
where
	order_delivered_customer_timestamp like '%%-01 %%'

# 3
## STEP 1
# perintahnya 5 atau lebih itu sesuaikan
select
	case when length(seller_zip_code_prefix) > 4 then seller_zip_code_prefix
    else lpad(seller_zip_code_prefix, 5, '0') end as seller_zip
from
	olist_sellers

## STEP 2
# null diasumsikan 00000
select
	case when length(seller_zip_code_prefix) > 4 then seller_zip_code_prefix
    else lpad(coalesce(seller_zip_code_prefix, '0'), 5, '0') end as seller_zip
from
	olist_sellers


# 4
select
	count(1) as count_reviews #menghiting baris, null gaakan masuk di count gaakan pernah masuk
from
	olist_order_reviews
where
	length(review_comment_message) > 80
    and review_creation_date like '2017%'
##


# 5
select
	customer_city,
	replace(customer_city, 'a', '') as cityconvert,
    length(customer_city) - length(replace(customer_city, 'a', '')) as num_of_a
from	
    (
	select distinct
		customer_city
	from
		olist_customers
	where
		customer_city is not null
	) as t

