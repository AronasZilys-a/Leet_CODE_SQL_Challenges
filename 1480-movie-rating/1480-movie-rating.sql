# Write your MySQL query statement below
(
select
u.name as results
from movierating mr
join users u on u.user_id = mr.user_id
group by mr.user_id
order by count(*) desc, u.name asc
limit 1
)
UNION ALL
(
select
m.title as results
from movierating mr
join movies m on mr.movie_id = m.movie_id
where left(created_at, 7) = '2020-02'
group by mr.movie_id
order by avg(mr.rating) desc, m.title asc
limit 1
)

