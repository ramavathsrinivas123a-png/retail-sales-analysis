-- 1. VIEW ALL DATA
SELECT *
FROM Raw_Data;


-- 2. VIEW SELECTED COLUMNS
SELECT
    product_name,
    category,
    region,
    sales_amount
FROM Raw_Data;


-- 3. FILTER ELECTRONICS
SELECT *
FROM Raw_Data
WHERE category = 'Electronics';


-- 4. FILTER USING AND
SELECT *
FROM Raw_Data
WHERE category = 'Electronics'
AND region = 'South';


-- 5. FILTER USING OR
SELECT *
FROM Raw_Data
WHERE region = 'South'
OR region = 'West';


-- 6. SALES ABOVE 10,000
SELECT
    sale_id,
    product_name,
    region,
    sales_amount,
    profit
FROM Raw_Data
WHERE sales_amount > 10000
ORDER BY sales_amount DESC;


-- 7. SALES BETWEEN 5,000 AND 10,000
SELECT
    sale_id,
    product_name,
    region,
    sales_amount
FROM Raw_Data
WHERE sales_amount BETWEEN 5000 AND 10000
ORDER BY sales_amount DESC;


-- 8. SALES ANALYSIS BY CATEGORY
SELECT
    category,
    SUM(sales_amount) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(*) AS sales_records
FROM Raw_Data
GROUP BY category
ORDER BY total_sales DESC;


-- 9. SALES ANALYSIS BY REGION
SELECT
    region,
    SUM(sales_amount) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS units_sold,
    COUNT(*) AS sales_records
FROM Raw_Data
GROUP BY region
ORDER BY total_sales DESC;


-- 10. MONTHLY SALES ANALYSIS
SELECT
    strftime('%Y-%m', order_date) AS sales_month,
    SUM(sales_amount) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(*) AS sales_records
FROM Raw_Data
GROUP BY sales_month
ORDER BY sales_month;


-- 11. TOP 10 HIGHEST SALES RECORDS
SELECT
    sale_id,
    order_date,
    product_name,
    category,
    region,
    sales_amount,
    profit
FROM Raw_Data
ORDER BY sales_amount DESC
LIMIT 10;


-- 12. PAYMENT METHOD ANALYSIS
SELECT
    payment_method,
    COUNT(*) AS transaction_count,
    SUM(sales_amount) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(sales_amount) AS average_sale
FROM Raw_Data
GROUP BY payment_method
ORDER BY total_sales DESC;


-- 13. TOP 10 PRODUCTS BY SALES
SELECT
    product_name,
    category,
    SUM(quantity) AS total_units_sold,
    SUM(sales_amount) AS total_sales,
    SUM(profit) AS total_profit
FROM Raw_Data
GROUP BY product_name, category
ORDER BY total_sales DESC
LIMIT 10;
