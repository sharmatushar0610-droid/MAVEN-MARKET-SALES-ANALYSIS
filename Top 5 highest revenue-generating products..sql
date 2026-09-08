SELECT p.product_name, SUM(s.quantity*CAST(REPLACE(REPLACE(TRIM(p.unit_price_usd),'$',''),',','')AS NUMERIC)) AS total_rev
FROM products p
JOIN sales s
ON p.productkey=s.productkey
GROUP BY product_name
ORDER BY total_rev DESC LIMIT 5;
