# Write your MySQL query statement below
with flags as
(
select
pid,
tiv_2015,
tiv_2016,
count(*) over( partition by concat(cast(lat as char),' ',cast(lon as char))) as location_flag,
sum(tiv_2015) over (partition by tiv_2015) as tiv_flag
from insurance
)

select
round(sum(tiv_2016),2) as tiv_2016
from flags
where tiv_2015 != tiv_flag
and location_flag = 1
