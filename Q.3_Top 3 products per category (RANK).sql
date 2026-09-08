SELECT category, product_name, total_revenue
FROM (
    SELECT  p.category,p.product_name,
        SUM(s.quantity * REPLACE(REPLACE(p.unit_price_usd, '$', ''), ',', '')::numeric) AS total_revenue,
        ROW_NUMBER() OVER (PARTITION BY p.category ORDER BY SUM(s.quantity * REPLACE(REPLACE(p.unit_price_usd, '$', ''), ',', '')::numeric) DESC
        ) AS rn
    FROM sales  s
    JOIN products  p
    ON s.productkey = p.productkey
    GROUP BY p.category, p.product_name
) AS t
WHERE rn <= 3
ORDER BY category, total_revenue DESC;
