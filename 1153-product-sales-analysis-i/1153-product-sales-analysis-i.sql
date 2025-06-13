# Write your MySQL query statement below
select
product_name,year,price
from Product as P
join Sales as S on S.product_id = P.product_id