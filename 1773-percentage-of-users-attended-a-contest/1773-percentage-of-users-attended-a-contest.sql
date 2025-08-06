# Write your MySQL query statement below

with contest_users as
(
select
contest_id,
count(user_id) user_per_contest
from register
group by contest_id
),

total_users as
(
select
count(distinct user_id) as total_users
from users
),

ready_table as
(
select
contest_id,
user_per_contest,
total_users
from contest_users
cross join total_users
)

select
contest_id,
round((user_per_contest / total_users) * 100,2) as percentage
from ready_table
order by percentage desc, contest_id asc