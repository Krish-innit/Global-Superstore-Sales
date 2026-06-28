-- Discount and returns
-- ============================

-- Discount and sales relation
SELECT SUM(discount) AS total_discount, SUM(sales) AS total_sales, product_name,
RANK() OVER(ORDER BY SUM(sales) DESC) AS product_rank
FROM orders
GROUP BY product_name
ORDER BY total_discount DESC;

-- ============================

-- Return rate of products
WITH returned_orders AS (
SELECT DISTINCT order_id
FROM returns
),
order_level AS (
SELECT
order_id,
product_name
FROM orders
GROUP BY order_id, product_name
)
SELECT
o.product_name,
COUNT(o.order_id) AS total_orders,
COUNT(r.order_id) AS returned_orders,
COUNT(r.order_id) * 100.0 / COUNT(o.order_id) AS return_rate
FROM order_level o
LEFT JOIN returned_orders r
ON o.order_id = r.order_id
GROUP BY o.product_name
ORDER BY return_rate DESC;

-- ============================