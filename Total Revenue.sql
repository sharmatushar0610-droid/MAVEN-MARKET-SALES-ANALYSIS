SELECT ROUND(SUM(s.quantity*CAST(REPLACE(REPLACE(TRIM(p.unit_price_usd),'$',''),',','')AS NUMERIC)),2) AS total_rev
FROM products p
JOIN sales s
ON p.productkey=s.productkey;
