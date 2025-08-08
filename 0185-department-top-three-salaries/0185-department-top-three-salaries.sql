# Write your MySQL query statement below

with flags as
(
select
*,
dense_rank() over(partition by departmentid order by salary desc) top_flag
from employee
)

select
d.name as Department,
f.name as Employee,
f.salary as Salary
from flags f
join department d on f.departmentid = d.id
where top_flag <= 3
