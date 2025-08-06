# Write your MySQL query statement below
with first_date_identify as
(
  SELECT
    delivery_id,
    customer_id,
    order_date,
    customer_pref_delivery_date,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date ASC, delivery_id ASC) AS rn
  FROM Delivery
),

first_filtered as
(
select
    delivery_id,
    customer_id,
    order_date,
    customer_pref_delivery_date
    from first_date_identify
    WHERE rn = 1
)

select
    round((sum(case
        when datediff(customer_pref_delivery_date, order_date) = 0
        then 1 else 0 end)
        / count(*)
        ) * 100,2) as immediate_percentage
    
    from first_filtered