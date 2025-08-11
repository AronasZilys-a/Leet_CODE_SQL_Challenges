# Write your MySQL query statement below

select
p.product_name,
sum(o.unit) as unit
from orders o
join products p on o.product_id = p.product_id
where left(o.order_date,7) = '2020-02'
group by p.product_id, left(o.order_date,7)
having sum(o.unit) >= 100