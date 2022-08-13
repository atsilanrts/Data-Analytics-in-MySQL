
# 1
select
	date_diff,
    count(1) as num_review #hitung per baris kategori
from
    
    (
		select
			review_creation_date,
			review_answer_timestamp,
			datediff(review_answer_timestamp, review_creation_date) as date_diff
		from
			olist_order_reviews
	) as t
group by # krn ada aggregat count
	1
order by
	1

    
# 2
## krn diminta tabel, berarti outputnya semua kolomnya
select
    order_id,
    customer_id,
    order_status,
    date_add(order_purchase_timestamp, interval 7 hour) as order_purchase_timestamp,
    date_add(order_approved_at, interval 7 hour) as order_approved_at,
    date_add(order_delivered_carrier_timestamp, interval 7 hour) as order_delivered_carrier_timestamp,
    date_add(order_delivered_customer_timestamp, interval 7 hour) as order_delivered_customer_timestamp,
    order_estimated_delivery_date
from
	olist_orders


# 3
# order approved: barang dibayar cust
# shipping limit: waktu antar

# step 1 : join dulu
select
	shipping_limit_date,
    order_approved_at,
    datediff(shipping_limit_date, order_approved_at) as diff
from
	olist_order_items as t1
    inner join 
    olist_orders as t2
    on t1.order_id = t2.order_id
# waktunya sama tapi tanggalnya beda

# step 2 : kelompokkin
select
	diff,
    count(1) as count_diff
from
	(
		select
			shipping_limit_date,
			order_approved_at,
			datediff(shipping_limit_date, order_approved_at) as diff
		from
			olist_order_items as t1
			inner join 
			olist_orders as t2
			on t1.order_id = t2.order_id
	) as t
    
group by
	1
order by
	1


