SELECT cust.customer_city, CAST(ord.[order_purchase_timestamp] AS DATE) AS order_date, COUNT(cust.customer_city) as city_count
FROM [ecom].[dbo].[olist_orders_dataset] as ord
JOIN [ecom].[dbo].[olist_customers_dataset] as cust
ON cust.customer_id = ord.customer_id
WHERE ord.[order_status] = 'delivered'
GROUP BY cust.customer_city, ord.[order_purchase_timestamp]
ORDER BY city_count desc;