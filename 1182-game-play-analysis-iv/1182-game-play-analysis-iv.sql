# Write your MySQL query statement below
with first_login as
(
  SELECT
    player_id,
    MIN(event_date) AS first_login_date
  FROM activity
  GROUP BY player_id
),

next_login as
(
    select
    count(f.player_id) as total_next_day
    from first_login f
    JOIN activity a
    ON f.player_id = a.player_id
    WHERE a.event_date = DATE_ADD(f.first_login_date, INTERVAL 1 DAY)
)

select
round(n.total_next_day / count(distinct a.player_id),2) as fraction
from activity a
CROSS JOIN next_login n