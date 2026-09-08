SELECT 
    p.category,
    p.subcategory,
    SUM(s.quantity) AS total_qty,
    SUM(s.quantity * CAST(REPLACE(REPLACE(p.unit_price_usd, '$', ''), ',', '') AS NUMERIC)) AS total_revenue_usd
FROM sales s
JOIN products p ON s.productkey = p.productkey
GROUP BY p.category, p.subcategory
ORDER BY total_revenue_usd DESC
LIMIT 10;
