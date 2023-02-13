SELECT namt.product_category_name_english, CAST(orders.order_purchase_timestamp AS DATE) AS order_purchase_timestamp, COUNT(namt.product_category_name_english) AS product_count
FROM [ecom].[dbo].[olist_orders_dataset] orders
JOIN [ecom].[dbo].[olist_order_items_dataset] ois
ON orders.order_id = ois.order_id
JOIN [ecom].[dbo].[olist_products_dataset] prods
ON ois.product_id = prods.product_id
JOIN [ecom].[dbo].[product_category_name_translation] namt
ON prods.product_category_name = namt.product_category_name
WHERE YEAR(orders.order_purchase_timestamp) = '2017' AND MONTH(orders.order_purchase_timestamp) = '07'
GROUP BY namt.product_category_name_english, orders.order_purchase_timestamp
ORDER BY product_count desc;
