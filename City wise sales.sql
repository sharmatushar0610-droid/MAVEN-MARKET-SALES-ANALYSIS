SELECT  c.city, SUM(s.quantity) AS total_quantity_sold
FROM sales s
JOIN customers c
ON s.customerkey = c.customerkey
GROUP BY c.city
ORDER BY total_quantity_sold DESC
LIMIT 10;
