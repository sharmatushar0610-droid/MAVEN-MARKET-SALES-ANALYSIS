SELECT TO_CHAR(order_date,'YYYY-MON') as year_month ,SUM(s.quantity*CAST(REPLACE(REPLACE(TRIM(p.unit_price_usd),'$',''),',','')AS NUMERIC)) AS total_rev
FROM products p
JOIN sales s
ON p.productkey=s.productkey
GROUP BY year_month
ORDER BY year_month;
