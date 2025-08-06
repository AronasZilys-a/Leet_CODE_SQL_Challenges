# Write your MySQL query statement below
WITH FirstYear AS (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
)

SELECT
    s.product_id,
    fy.first_year,
    s.quantity,
    s.price
FROM Sales s
JOIN FirstYear fy
  ON s.product_id = fy.product_id
 AND s.year = fy.first_year;
