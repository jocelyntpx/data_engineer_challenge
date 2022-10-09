-- TASKS

-- 1. I want to know the list of our customers and their spending.
SELECT customer_id, customer_name, coalesce(sum(price_sold),0) AS money_spent
FROM customer c
LEFT JOIN transaction t ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 2. I want to find out the top 3 car manufacturers that customers bought by sales (quantity) and the sales number for it in the current month.
SELECT m2.salesperson_id, m2.salesperson_name, COUNT(transaction_id) AS sales_quality, SUM(price_sold) AS sales_amount
FROM transaction
LEFT JOIN car c ON transaction.car_id = c.car_id
LEFT JOIN model m ON c.model_id = m.model_id
LEFT JOIN manufacturer m2 ON m.manufacturer_id = m2.manufacturer_id
GROUP BY m2.salesperson_id, m2.salesperson_name 
ORDER BY sales DESC 
LIMIT 3
