# Write your MySQL query statement below

select
m.name
from employee m
JOIN employee e on m.id = e.managerid
group by m.name, m.id
having count(e.managerid) >= 5