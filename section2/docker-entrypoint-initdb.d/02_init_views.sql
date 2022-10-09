CREATE OR REPLACE VIEW TransactionHistory AS
SELECT transaction_id AS transaction_id,
       s.salesperson_name AS salesperson,
       c2.customer_name  AS customer,
       m.model_name         AS model,
       market_price   AS market_price,
       price_sold     AS price_sold,
       transaction_date
FROM Transaction t
LEFT JOIN car c ON c.car_id = t.car_id
LEFT JOIN customer c2 ON c2.customer_id = t.customer_id
LEFT JOIN salesperson s ON s.salesperson_id = t.salesperson_id
LEFT JOIN model m ON c.model_id = m.model_id
