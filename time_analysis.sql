-- Time analysis
-- ===================================

-- Monthly difference in revenue
WITH monthly AS (
SELECT DATE_TRUNC('month', order_date) AS month,
SUM(sales) AS sales
FROM orders GROUP BY 1
)
SELECT
month, sales, LAG(sales) OVER (ORDER BY month) AS prev_month_sales,
sales - LAG(sales) OVER (ORDER BY month) AS difference
FROM monthly;

-- ===================================

-- Quarterly sales percentage
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

-- ===================================

-- Yearly growth
SELECT 
DATE_TRUNC('year',order_date) AS year,
SUM(sales) AS total_sales
FROM orders
GROUP BY year
ORDER BY total_sales ASC;

-- ===================================