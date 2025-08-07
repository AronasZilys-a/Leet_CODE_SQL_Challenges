# Write your MySQL query statement below
with total_products as
(
select
count(distinct product_key) as available_products
from product
),

full_table as
(
select
c.customer_id as customer_id,
count(distinct c.product_key) as purchases,
tp.available_products as available
from customer c
cross join total_products tp
group by c.customer_id
)

select
customer_id
from full_table
where purchases = available