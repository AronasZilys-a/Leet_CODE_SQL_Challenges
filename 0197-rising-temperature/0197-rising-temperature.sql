SELECT today.id
FROM Weather yesterday
CROSS JOIN Weather today
where datediff(today.recordDate,yesterday.recordDate) = 1
and today.temperature > yesterday.temperature
