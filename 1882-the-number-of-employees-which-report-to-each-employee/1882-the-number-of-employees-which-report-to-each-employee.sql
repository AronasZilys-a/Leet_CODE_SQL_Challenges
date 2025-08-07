# Write your MySQL query statement below

select
e.employee_id,
e.name,
count(r.reports_to) reports_count,
round(avg(r.age),0) average_age
from employees e
join employees r on e.employee_id = r.reports_to
group by e.employee_id , e.name
order by e.employee_id