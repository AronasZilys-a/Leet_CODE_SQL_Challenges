# Write your MySQL query statement below
select
activity_date as day,
count(distinct user_id) as active_users
from activity
where activity_type is not null
    and activity_date BETWEEN DATE_ADD('2019-07-27', INTERVAL -29 DAY) AND '2019-07-27'
group by activity_date