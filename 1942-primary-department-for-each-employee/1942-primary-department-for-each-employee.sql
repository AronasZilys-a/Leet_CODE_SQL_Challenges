# Write your MySQL query statement below
with flag as
(
select
employee_id,
department_id,
primary_flag,
count(*) over(partition by employee_id) number_flag
from employee
)

select
employee_id,
department_id
from flag
where primary_flag = 'Y' or number_flag = 1