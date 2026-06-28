-- Seller and Region analysis
-- =============================

SELECT person, orders.region,
SUM(sales) AS total_sales,
RANK() OVER(ORDER BY SUM(sales) DESC) AS seller_rank
FROM orders 
LEFT JOIN people ON orders.region = people.region
GROUP BY person, orders.region;

-- =============================