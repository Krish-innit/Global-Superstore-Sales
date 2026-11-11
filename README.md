# Global-Superstore-Sales

<img width="978" height="545" alt="Screenshot 2026-11-11 102313" src="https://github.com/user-attachments/assets/86100ed1-1f62-4ad9-bfb9-26e2586184b4" />

## Project Objective

Analyzed the Global Superstore dataset using PostgreSQL to identify sales trends, product performance, regional performance, and profitability. Built an interactive Power BI dashboard to present key business metrics and insights.

## Dataset

* 25K+ sales records
* Sales, customer, product, regional, shipping, and return data
* Global Superstore Dataset (kaggle.com)

## SQL Files

* `kpi.sql` – Business KPIs
* `customer_analysis.sql` – Customer sales contribution
* `product_analysis.sql` – Product performance and profit margin
* `sales_performance.sql` – Seller and regional analysis
* `time_analysis.sql` – Monthly trends, quarterly contribution, and yearly growth
* `discount_return_analysis.sql` – Product return rate and discount analysis

## SQL Concepts Used

* Aggregations
* Joins
* Common Table Expressions (CTEs)
* Window Functions (`RANK()`, `LAG()`)
* Date Functions
* Conditional Aggregation
* KPI Calculations

## Analysis Performed

* Calculated Total Orders, Total Sales, Total Profit, and Overall Profit Margin.
* Identified highest and lowest performing product based on sales.
* Ranked sellers and regions based on total sales.
* Analyzed monthly revenue trend, month-over-month revenue difference and year-over-year sales growth.
* Calculated quarterly sales contribution to identify seasonal sales pattern.
* Compared profit margins across different product categories.
* Measured product return rate to identify frequently returned products.
* Analyzed sales contribution of top customers.
* Evaluated relationship between product discounts and sales performance.

## Key Insights

* Overall sales increased over the year showing steady business growth.
* Q4 contributes to the largest share (more than 30%) of annual sales, while Q1 contribute the least.
* Revenue is distributed across a broad customer base with top 10 customers contributing to only 2.4% of total sales.
* Some products show a 100% return rate which may require further investigation.
* Sales performance varies across regions and sellers, with some consistently outperforming others.
* Product discounts do not appear to have a direct impact on sales, as the highest-selling products offer relatively low discounts.
* The Furniture category has a significantly lower profit margin than the Technology and Office Supplies categories.

## Recommendations

* Review the lowest-performing products, as they contribute minimally to overall sales. Consider whether they should be improved or discontinued.
* Focus on Q3 and Q4, as they generate the highest share of annual sales.
* Investigate the lowest-performing sellers to identify the reasons behind their low sales.
* Investigate products with high return rates to identify the cause and reduce future returns.

#### Data Set 
https://www.kaggle.com/datasets/shekpaul/global-superstore/data
