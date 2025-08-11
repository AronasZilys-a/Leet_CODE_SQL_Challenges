# Write your MySQL query statement below
select
*
from users
where  REGEXP_LIKE(mail, '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\\.com$', 'c');

