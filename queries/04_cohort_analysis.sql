-- =========================================================
-- Analysis 4: Cohort Analysis (Customer Retention)
-- =========================================================
-- Objective:
-- Measure customer retention by tracking how many users from each
-- signup cohort return and place orders in subsequent months.

-- Business Definition:
-- A "cohort" is a group of customers who signed up in the same month.
-- We evaluate how many of these customers remain active over time.

-- Key Concepts:
-- cohort_month = month when customer signed up
-- order_month  = month when customer placed an order
-- active_users = number of unique customers placing orders

-- Tables Used:
-- customers → provides signup_date (defines cohort)
-- orders    → provides order_date (defines activity)

-- Join Logic:
-- customers.customer_id = orders.customer_id

-- Granularity:
-- Aggregation at (cohort_month, order_month)

-- Steps:
-- 1. Assign each customer to a cohort (based on signup_date)
-- 2. Extract order activity month from orders
-- 3. Join customers with orders
-- 4. Count DISTINCT customers per cohort per month
-- 5. Sort results for time-based analysis

-- Output Columns:
-- cohort_month | order_month | active_users

-- Notes:
-- - COUNT(DISTINCT customer_id) avoids double counting
-- - DATE_TRUNC ensures proper monthly grouping
-- - This is a retention analysis, not revenue analysis

WITH cohort_data AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', signup_date) AS cohort_month
    FROM customers
),
order_data AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', order_date) AS order_month
    FROM orders
)

SELECT
    c.cohort_month,
    o.order_month,
    COUNT(DISTINCT o.customer_id) AS active_users
FROM cohort_data c
JOIN order_data o
    ON c.customer_id = o.customer_id
GROUP BY
    c.cohort_month,
    o.order_month
ORDER BY
    c.cohort_month,
    o.order_month;