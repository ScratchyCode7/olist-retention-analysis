-- Monthly Cohort Retention Analysis
WITH customer_cohorts AS (
    -- Step 1: Identify first purchase date (Cohort Month) per unique customer
    SELECT 
        c.customer_unique_id,
        MIN(STRFTIME('%Y-%m-01', o.order_purchase_timestamp)) AS cohort_month
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
),
customer_activities AS (
    -- Step 2: Map all activity dates (Activity Month) per customer
    SELECT 
        c.customer_unique_id,
        STRFTIME('%Y-%m-01', o.order_purchase_timestamp) AS activity_month
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id, activity_month
),
cohort_size AS (
    -- Step 3: Count total starting customers per cohort
    SELECT 
        cohort_month,
        COUNT(DISTINCT customer_unique_id) AS total_customers
    FROM customer_cohorts
    GROUP BY cohort_month
)
-- Step 4: Calculate month index and retention percentage
SELECT 
    cc.cohort_month,
    cs.total_customers,
    (
        (STRFTIME('%Y', ca.activity_month) - STRFTIME('%Y', cc.cohort_month)) * 12 +
        (STRFTIME('%m', ca.activity_month) - STRFTIME('%m', cc.cohort_month))
    ) AS month_number,
    COUNT(DISTINCT ca.customer_unique_id) AS active_customers,
    ROUND(
        CAST(COUNT(DISTINCT ca.customer_unique_id) AS REAL) / cs.total_customers * 100, 2
    ) AS retention_rate_pct
FROM customer_cohorts cc
JOIN customer_activities ca ON cc.customer_unique_id = ca.customer_unique_id
JOIN cohort_size cs ON cc.cohort_month = cs.cohort_month
GROUP BY cc.cohort_month, month_number
ORDER BY cc.cohort_month, month_number;