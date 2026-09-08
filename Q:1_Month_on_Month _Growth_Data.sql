WITH monthly_revenue AS(
SELECT
TO_CHAR(DATE_TRUNC('month',order_date),'yyyy-mon' )AS month, SUM(s.quantity * REPLACE(REPLACE(p.unit_price_usd, '$', ''), ',', '')::numeric) AS total_revenue
FROM sales s
JOIN products p
ON s.productkey=s.productkey
GROUP BY 1
)
SELECT month, total_revenue, LAG(total_revenue) OVER(ORDER BY month) AS prev_month_revenue,
        ROUND((total_revenue - LAG(total_revenue) OVER(ORDER BY month))*100.00/LAG(total_revenue) OVER(ORDER BY month),2) AS growth_percentage
FROM monthly_revenue
ORDER BY month;
