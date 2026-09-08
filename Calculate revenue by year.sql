SELECT EXTRACT(year FROM order_date) AS year,SUM(s.quantity*CAST(REPLACE(REPLACE(TRIM(p.unit_price_usd),'$',''),',','')AS NUMERIC)) AS total_rev
FROM products p
JOIN sales s
ON p.productkey=s.productkey
GROUP BY year
ORDER BY year;
