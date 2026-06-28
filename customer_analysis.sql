-- Contribution of top customers
-- ===============================

WITH customer_sales AS (
SELECT customer_id, SUM(sales) AS total_sales
FROM orders
GROUP BY customer_id
),
top_customer AS (
SELECT * FROM customer_sales
ORDER BY total_sales DESC LIMIT 10
),
overall_sales AS (
SELECT SUM(sales) AS all_sales
FROM orders
)
SELECT
(SELECT SUM(total_sales) FROM top_customer) AS top_customer_sale,
(SELECT all_sales FROM overall_sales) AS total_sales,
ROUND((SELECT SUM(total_sales) FROM top_customer)* 100
/ (SELECT all_sales FROM overall_sales),2) AS top_customer_contribution;

-- ===============================