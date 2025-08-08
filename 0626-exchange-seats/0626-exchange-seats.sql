# Write your MySQL query statement below

select
id,
    case
    when (id = (select max(id) from seat) and id % 2 = 1 )
    then student

    when id % 2 = 1 then lead(student,1) over(order by id)
    
    when id % 2 = 0 then lag(student,1) over(order by id)
    end as student

from seat