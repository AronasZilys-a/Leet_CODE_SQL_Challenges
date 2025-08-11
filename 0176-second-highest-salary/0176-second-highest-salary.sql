# Write your MySQL query statement below

with ranked as
(
select
distinct salary,
dense_rank() over(order by salary desc) as dr
from employee
)

SELECT 
    COALESCE(
        (select salary from ranked where dr = 2),
        NULL
    ) AS SecondHighestSalary;