-- Business Overview
-- ========================

SELECT COUNT(order_id) AS total_orders,
SUM(sales) AS total_sales,
SUM(profit) AS total_profit,
ROUND(SUM(profit) * 100 / SUM(sales), 2) AS overall_profit_margin
FROM orders;

-- ========================