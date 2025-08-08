# Write your MySQL query statement below

WITH daily_totals AS (
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM customer
    GROUP BY visited_on
),
moving_avg_and_total AS (
    SELECT
        visited_on,
        amount,
        ROUND(AVG(amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ), 2) AS average_amount,
        SUM(amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS rolling_total,
        ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
    FROM daily_totals
)
SELECT
    visited_on,
    rolling_total as amount,
    average_amount
FROM moving_avg_and_total
WHERE rn >= 7
ORDER BY visited_on;
