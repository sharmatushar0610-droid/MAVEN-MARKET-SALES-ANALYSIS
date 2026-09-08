SELECT 
    CASE 
        WHEN purchase_count > 1 THEN 'Repeat Customer'
        ELSE 'New Customer'
    END AS customer_type,
    COUNT(*) AS total_customers
FROM (
    SELECT customerkey, COUNT(*) AS purchase_count
    FROM sales
    GROUP BY customerkey
) AS t
GROUP BY customer_type;
