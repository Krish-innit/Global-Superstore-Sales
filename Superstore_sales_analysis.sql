-- Business Overview

SELECT COUNT(order_id) AS total_orders,
SUM(sales) AS total_sales,
SUM(profit) AS total_profit,
ROUND(SUM(profit) * 100 / SUM(sales), 2) AS overall_profit_margin
FROM orders;


-- Contribution of top customers (By Percentage)

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


-- Analysing Seller and Region Performance

SELECT person, orders.region,
SUM(sales) AS total_sales,
RANK() OVER(ORDER BY SUM(sales) DESC) AS seller_rank
FROM orders 
LEFT JOIN people ON orders.region = people.region
GROUP BY person, orders.region;


-- Product Analysis

-- Top 5 products
SELECT product_name, SUM(sales) AS total_sales
FROM orders
GROUP BY product_name 
ORDER BY total_sales DESC LIMIT 5;

-- Bottom 5 products
SELECT product_name, SUM(sales) AS total_sales
FROM orders
GROUP BY product_name 
ORDER BY total_sales ASC LIMIT 5; 


-- Analysing Category wise Profit
SELECT category,
ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin
FROM orders
GROUP BY category
ORDER BY profit_margin DESC;


-- Discount and returns

-- Discount and sales relation (If discount impact sales)
SELECT SUM(discount) AS total_discount, SUM(sales) AS total_sales, product_name,
RANK() OVER(ORDER BY SUM(sales) DESC) AS product_rank
FROM orders
GROUP BY product_name
ORDER BY total_discount DESC;

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


-- Time analysis

-- Difference In Revenue By Month
WITH monthly AS (
SELECT DATE_TRUNC('month', order_date) AS month,
SUM(sales) AS sales
FROM orders GROUP BY 1
)
SELECT
month, sales, LAG(sales) OVER (ORDER BY month) AS prev_month_sales,
sales - LAG(sales) OVER (ORDER BY month) AS difference
FROM monthly;

-- Sales Percentage BY Each Quarter
With quarterly_sales AS(
SELECT
EXTRACT(YEAR FROM order_date) AS year,
EXTRACT(QUARTER FROM order_date) AS quarter,
SUM(sales) AS total_sales
FROM orders GROUP BY 1, 2
),
total_year_sales AS(
SELECT year, SUM(total_sales) as yearly_sale 
FROM quarterly_sales
GROUP BY year
)
SELECT
q.year, q.quarter, q.total_sales,
ROUND((q.total_sales *100 / t.yearly_sale),2) AS sales_percentage
FROM quarterly_sales q
JOIN total_year_sales t ON q.year = t.year
ORDER BY q.year, q.quarter;

-- Yearly Growth of Sales
SELECT 
DATE_TRUNC('year',order_date) AS year,
SUM(sales) AS total_sales
FROM orders
GROUP BY year
ORDER BY total_sales ASC;







-------------------------------------------------------------------------------------
-- THE COMPLETE ANALYSIS IS IN README.MD (KEY FINDINGS, RECOMMEDNDATIONS ETC.)
-- Access the Dataset from Readme.Md
-- Create Tables and import data from all three csv 
-- Use the queries for analysis



-------------------------------------------------------------------------------------
