# Write your MySQL query statement below
with following as
(
select
num,
lead(num,1) over(order by id) as lead2,
lead(num,2) over(order by id) as lead3
from logs
)
select
num as ConsecutiveNums
from following
where num = lead2 and num = lead3
group by num