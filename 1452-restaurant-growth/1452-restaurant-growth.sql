# Write your MySQL query statement below

with daily_totals as
(
    select
    visited_on,
    sum(amount) as amount
    from customer
    group by visited_on
),

seven_days as
(
    select
    visited_on,
    sum(amount) over(order by visited_on asc rows between 6 preceding and current row) as amount,
    round(avg(amount) over(order by visited_on asc rows between 6 preceding and current row),2) as average_amount
    from daily_totals
)

select
*
from seven_days
limit 9999999 offset 6