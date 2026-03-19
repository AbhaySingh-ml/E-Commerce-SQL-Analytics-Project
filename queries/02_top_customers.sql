-- =========================================================
-- Analysis 2: Top Customers
-- =========================================================
-- Objective:
-- Identify top customers based on total revenue contribution.

-- Business Definition:
-- "Top customers" = customers who generate the highest revenue,
-- not just those who place the most orders.

-- Key Metrics:
-- total_spent      = SUM(quantity * price)
-- total_orders     = COUNT(DISTINCT order_id)
-- avg_order_value  = total_spent / total_orders

-- Tables Used:
-- customers     → customer details (name, id)
-- orders        → connects customers to transactions
-- order_items   → contains revenue data (quantity, price)

-- Logic:
-- 1. Join customers → orders → order_items
-- 2. Compute total revenue per customer
-- 3. Count number of orders per customer
-- 4. Calculate average order value
-- 5. Sort customers by highest total_spent
-- 6. Limit to top 10 customers

-- Output:
-- customer_id | customer_name | total_spent | total_orders | avg_order_value

-- Notes:
-- Revenue is computed at row level (quantity * price) and aggregated at customer level.
-- COUNT(DISTINCT order_id) avoids duplicate counting due to multiple items per order.
-- ROUND() is used for clean financial presentation.



SELECT
    c.customer_id,
    c.customer_name,
    ROUND(SUM(oi.quantity * oi.price), 2) AS total_spent,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * oi.price) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 10;