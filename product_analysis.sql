-- Product Analysis
-- ==============================

-- Top 5 products
SELECT product_name, SUM(sales) AS total_sales
FROM orders
GROUP BY product_name 
ORDER BY total_sales DESC LIMIT 5;

-- ==============================

-- Bottom 5 products
SELECT product_name, SUM(sales) AS total_sales
FROM orders
GROUP BY product_name 
ORDER BY total_sales ASC LIMIT 5;

-- ==============================

-- Profit Margin by Category
SELECT category,
ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin
FROM orders
GROUP BY category
ORDER BY profit_margin DESC;

-- ==============================

