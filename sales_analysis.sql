-- Retail Sales analysis queries (PostgreSQL-style)
SELECT SUM(sales_amount) AS revenue, SUM(profit) AS profit, COUNT(DISTINCT order_id) AS orders FROM sales_data;
SELECT DATE_TRUNC('month', order_date::date) AS month, SUM(sales_amount) AS revenue FROM sales_data GROUP BY month ORDER BY month;
SELECT category, SUM(sales_amount) AS revenue, SUM(profit) AS profit FROM sales_data GROUP BY category ORDER BY revenue DESC;
SELECT region, SUM(sales_amount) AS revenue, SUM(profit) AS profit FROM sales_data GROUP BY region ORDER BY profit DESC;
SELECT product_name, SUM(sales_amount) AS revenue FROM sales_data GROUP BY product_name ORDER BY revenue DESC LIMIT 10;
SELECT payment_method, COUNT(DISTINCT order_id) AS orders, SUM(sales_amount) AS revenue FROM sales_data GROUP BY payment_method ORDER BY revenue DESC;
