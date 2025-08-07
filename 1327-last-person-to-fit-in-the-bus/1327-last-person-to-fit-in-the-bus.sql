# Write your MySQL query statement below
with accumulation as
(
select
*,
sum(weight) over (order by turn rows between unbounded preceding and current row) as running_weight
from queue
),

list as
(
select
*
from accumulation
where running_weight <= 1000
),

limit_list as
(
select
person_name,
running_weight,
max(running_weight) over() as limit_reached
from list
)

select
person_name
from limit_list
where running_weight = limit_reached