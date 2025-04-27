1. Total Sales Per Product

SELECT product_id, SUM(total_price) AS total_sales
FROM retail_price
GROUP BY product_id
ORDER BY total_sales DESC

2. Monthly Sales Trend
SELECT month_year, SUM(total_price) AS monthly_sales
FROM retail_price
GROUP BY month_year
ORDER BY month_year

3. Average Price and Freight by Category
 
SELECT product_category_name,
       AVG(unit_price) AS avg_unit_price,
       AVG(freight_price) AS avg_freight
FROM retail_price
GROUP BY product_category_name

4. Top Products by Quantity Sold

SELECT Top 10 product_id, SUM(qty) AS total_qty
FROM retail_price
GROUP BY product_id
ORDER BY total_qty DESC

5.  Compare Own Price vs Competitor (comp_1)

SELECT product_id,
       AVG(unit_price) AS avg_own_price,
       AVG(comp_1) AS avg_comp1_price
FROM retail_price
GROUP BY product_id

6.  Impact of Holidays on Sales

SELECT holiday, SUM(total_price) AS total_sales
FROM retail_price
GROUP BY holiday

7. Average Freight by Weight Range
SELECT
    CASE
        WHEN product_weight_g < 500 THEN 'Light'
        WHEN product_weight_g BETWEEN 500 AND 2000 THEN 'Medium'
        ELSE 'Heavy'
    END AS weight_category,
    AVG(freight_price) AS avg_freight
FROM retail_price
GROUP BY
    CASE
        WHEN product_weight_g < 500 THEN 'Light'
        WHEN product_weight_g BETWEEN 500 AND 2000 THEN 'Medium'
        ELSE 'Heavy'
    END
8. Price Change Over Time for a Product

SELECT product_id, month_year, unit_price, lag_price,
       (unit_price - lag_price) AS price_change
FROM retail_price
WHERE product_id = 'bed1'
ORDER BY month_year

9. Customer Purchase Patterns by Weekday

SELECT weekday, COUNT(DISTINCT customers) AS unique_customers,
       SUM(total_price) AS total_sales
FROM retail_price
GROUP BY weekday
ORDER BY weekday

10.  Conversion Rate by Product Score

SELECT product_score,
       COUNT(*) AS num_orders,
       SUM(qty) AS total_units,
       SUM(total_price) AS total_revenue
FROM retail_price
GROUP BY product_score
ORDER BY product_score DESC

11. Product Volume Contribution

SELECT product_id,
       SUM(volume) AS total_volume,
       SUM(total_price) AS total_sales,
       SUM(volume) / SUM(total_price) AS volume_per_dollar
FROM retail_price
GROUP BY product_id
ORDER BY volume_per_dollar DESC

12. Category Performance on Weekends vs Weekdays

SELECT product_category_name,
       SUM(CASE WHEN weekend = 1 THEN total_price ELSE 0 END) AS weekend_sales,
       SUM(CASE WHEN weekend = 0 THEN total_price ELSE 0 END) AS weekday_sales
FROM retail_price
GROUP BY product_category_name

13. Freight as a Percentage of Total Price

SELECT product_id,
       AVG(freight_price / total_price) * 100 AS avg_freight_percentage
FROM retail_price
GROUP BY product_id
ORDER BY avg_freight_percentage DESC

14. Product Description & Name Length vs Sales

SELECT product_id,
       AVG(product_name_lenght) AS avg_name_length,
       AVG(product_description_lenght) AS avg_description_length,
       SUM(total_price) AS total_sales
FROM retail_price
GROUP BY product_id

15. Correlation Proxy: Product Score vs Unit Price

SELECT product_id,
       AVG(product_score) AS avg_score,
       AVG(unit_price) AS avg_price
FROM retail_price
GROUP BY product_id
ORDER BY avg_score DESC



































































































































