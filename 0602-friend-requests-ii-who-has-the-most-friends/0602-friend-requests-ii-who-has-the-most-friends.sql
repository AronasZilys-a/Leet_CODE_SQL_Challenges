# Write your MySQL query statement below
with cte as
(
select
requester_id as id,
count(requester_id) as num
from requestaccepted
where requester_id = requester_id
group by requester_id

UNION ALL

select
accepter_id as id,
count(accepter_id) as num
from requestaccepted
where accepter_id = accepter_id
group by accepter_id
)

select
id,
sum(num) as num
from cte
group by id
order by sum(num) desc
limit 1
