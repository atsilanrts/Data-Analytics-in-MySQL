

# 1
select
	order_id,
    payment_type
from
	olist_order_payments
where
	payment_value/payment_installments >= 30
    and payment_type = 'credit_card'
    
# 2
select
	payment_value,
    payment_value/100 as step_1,
    ceil(payment_value/100) as step_2,
    100*ceil(payment_value/100) as step_3
from
	olist_order_payments
    
# 3 4
select
	product_category_name_english,
    max_density
from
    
    (
		select
			product_category_name,
			max(density) as max_density
		from

			(
				select
					product_category_name,
					product_weight_g/(product_length_cm*product_width_cm*product_height_cm) as density
				from
					olist_products
			) as t
		group by
			1
	) as t1
    inner join
    product_category_name_translation as t2
    on t1.product_category_name = t2.product_category_name
