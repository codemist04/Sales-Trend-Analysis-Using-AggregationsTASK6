

SELECT
  STRFTIME('%Y', order_date) AS order_year,
  STRFTIME('%m', order_date) AS order_month,
  COUNT(*) AS rows_in_group
FROM orders_clean
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


SELECT * FROM orders_clean LIMIT 5;


SELECT DISTINCT STRFTIME('%m', order_date) AS month
FROM orders_clean
ORDER BY month;


SELECT
  STRFTIME('%Y', order_date) AS order_year,
  STRFTIME('%m', order_date) AS order_month,
  COUNT(*) AS rows_in_group
FROM orders_clean
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


SELECT
  STRFTIME('%Y', order_date) AS order_year,
  STRFTIME('%m', order_date) AS order_month,
  ROUND(SUM(amount), 2) AS monthly_revenue
FROM orders_clean
GROUP BY order_year, order_month
ORDER BY order_year DESC, order_month DESC;


SELECT
  STRFTIME('%Y', order_date) AS order_year,
  STRFTIME('%m', order_date) AS order_month,
  COUNT(DISTINCT order_id) AS order_count
FROM orders_clean
GROUP BY order_year, order_month
ORDER BY order_year DESC, order_month DESC;


SELECT
  STRFTIME('%Y', order_date) AS order_year,
  STRFTIME('%m', order_date) AS order_month,
  ROUND(SUM(amount), 2) AS monthly_revenue
FROM orders_clean
GROUP BY order_year, order_month
ORDER BY monthly_revenue DESC
LIMIT 12;


SELECT
    STRFTIME('%Y', Date) AS order_year,
    STRFTIME('%m', Date) AS order_month,
    ROUND(SUM("Total Revenue"), 2) AS total_revenue,
    COUNT(DISTINCT "Transaction ID") AS order_count
FROM orders
WHERE Date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


WITH monthly AS (
  SELECT
    STRFTIME('%Y', order_date) AS order_year,
    STRFTIME('%m', order_date) AS order_month,
    ROUND(SUM(amount), 2) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_count
  FROM orders_clean
  GROUP BY order_year, order_month
)
SELECT
  order_year,
  order_month,
  total_revenue,
  order_count
FROM monthly
ORDER BY order_year DESC, order_month DESC
LIMIT 12;





