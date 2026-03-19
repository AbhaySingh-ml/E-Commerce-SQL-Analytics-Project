-- =========================================================
-- Analysis 1: Monthly Revenue Trend
-- =========================================================
-- Objective:
-- Calculate total revenue generated per month

-- Metric:
-- revenue = quantity * price

-- Tables Used:
-- orders, order_items

SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;