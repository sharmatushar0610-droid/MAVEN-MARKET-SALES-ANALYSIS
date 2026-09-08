WITH yearly AS (
    SELECT 
        EXTRACT(YEAR FROM s.order_date)::int AS year,
        SUM(s.quantity * REPLACE(REPLACE(p.unit_price_usd, '$', ''), ',', '')::numeric) AS total_revenue
    FROM sales s
    JOIN products p
	ON s.productkey = p.productkey
    GROUP BY 1
)
SELECT 
    year, total_revenue,
    LAG(total_revenue) OVER (ORDER BY year) AS prev_year_revenue,
    ROUND(
        (total_revenue - LAG(total_revenue) OVER (ORDER BY year)) * 100.0 
        / LAG(total_revenue) OVER (ORDER BY year), 2
    ) AS growth_pct
FROM yearly
ORDER BY year;
