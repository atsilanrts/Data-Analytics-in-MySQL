## QUIZ 4

# 1
select
	count(1) as num_rows_olistseller
from
	olist_sellers
    
# 2
select
	customer_state, ##kategori
    count(distinct customer_city) as cust_city_unique,
    count(customer_city) as cust_city
from
	olist_customers
group by
	customer_state
order by
	1
##note: pake distinct buat unik, biar tau pas kota2nya brp aja
## kalo count biasa berarti utk semua record

## biar null gak kebaca
select
	customer_state, ##kategori
    count(distinct customer_city) as cust_city_unique
from
	olist_customers
where
	customer_state is not null
group by
	customer_state
order by ## alphabet
	1

# 3
select
	payment_type,
    payment_installments,
    sum(payment_value) as pay_value
from
	olist_order_payments
where
	payment_type = 'credit_card'
    and payment_installments > 1
group by
	payment_installments
order by
	payment_installments

# 4
select
    avg(product_weight_g) as avg_weight
from
	olist_products
where
	product_length_cm between 40 and 80
## note: gapake group by dan length gadimasukin di select
## krn gaminta dikelompokkan

# 5
select
    seller_id,
    sum(price) as sum_price_seller
from
	olist_order_items
group by
	1
having ##kondisi aggregat
	sum(price) > 2000
order by
	2 desc



