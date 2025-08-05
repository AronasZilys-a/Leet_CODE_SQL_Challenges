# Write your MySQL query statement below
WITH start_times AS (
    SELECT
        machine_id,
        process_id,
        activity_type AS type_start,
        timestamp AS start_time
    FROM activity
    WHERE activity_type = 'start'
),

full_table AS (
    SELECT
        st.machine_id,
        st.process_id,
        st.type_start,
        st.start_time,
        a.activity_type AS type_end,
        a.timestamp AS end_time,
        a.timestamp - start_time AS processing_time
    FROM start_times st
    LEFT JOIN activity a
        ON st.machine_id = a.machine_id
        AND st.process_id = a.process_id
        AND a.activity_type = 'end'
)

SELECT
    machine_id,
    round(AVG(processing_time),3) AS processing_time
FROM full_table
GROUP BY machine_id;
