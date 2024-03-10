show databases;
use project;
SELECT * FROM project.olist_customers_dataset;
select * from olist_customers_dataset;
select * from olist_geolocation_dataset;
select * from olist_order_items_dataset;
select * from olist_order_payments_dataset;
select * from olist_order_reviews_dataset;
select * from olist_orders_dataset1;
select * from olist_products_dataset;
select * from olist_sellers_dataset;
select * from product_category_name_translation;
-- WEEKDAY V/S WEEKEND WITH PAYMENT VALUE.
select Days,round(sum(payment_value),0) as payments from olist_orders_dataset1  as o left join  olist_order_payments_dataset as op
on o.order_id=op.order_id
group by Days 
having sum(payment_value);
-- NO OF ORDERS WITH REVIEW SCORE 5 AND PAYMENT TYPE CREDIT CARD.
select review_score,payment_type,count(*) as No_of_orders from olist_order_payments_dataset as op left join olist_order_reviews_dataset as ore
on op.order_id=ore.order_id
where review_score=5 and payment_type="credit_card";
-- AVERAGE NO OF DAYS FOR DELIVER THE PRODUCT OF PET SHOP.
select product_category_name, round(avg(No_of_days),0) from olist_products_dataset as p left join olist_order_items_dataset as oi
on oi.product_id=p.product_id
left join olist_orders_dataset1 as o
on o.order_id=oi.order_id
group by product_category_name
having product_category_name="pet_shop";
-- AVERAGE PRICE AND AVERAGE PAYMENTS FROM SAO PAULO CITY.
Select customer_city,round(avg(price),0),round(avg(payment_value),0) from olist_order_items_dataset as oi left join olist_order_payments_dataset as op
on op.order_id=oi.order_id
left join olist_orders_dataset1 as o
on op.order_id=o.order_id
left join  olist_customers_dataset as c
on c.customer_id=o.customer_id
group by customer_city
having avg(price) and avg(payment_value) and customer_city="sao paulo";
-- SHIPPING DAYS V/S REVIEW SCORE
select review_score,round(avg(No_of_days),0)  as shipping_days from olist_orders_dataset1 as o left join olist_order_reviews_dataset as ore
on o.order_id=ore.order_id
group by review_score
order by review_score;