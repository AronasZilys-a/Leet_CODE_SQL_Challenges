# Write your MySQL query statement below
with categories as
(
select 'Low Salary' as category
UNION
select 'Average Salary'
UNION
select 'High Salary'
),

category_counts as
(
select
case
when income < 20000 then 'Low Salary'
when income >= 20000 and income <= 50000 then 'Average Salary'
else 'High Salary' end as category,
count(account_id) as counts
from accounts
group by category
)

select
c.category,
coalesce(ct.counts,0) as accounts_count
from categories c
left join category_counts ct on c.category = ct.category