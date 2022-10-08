create or replace view TransactionHistory as
select transaction_id as transaction_id,
       s.salesperson_name as salesperson,
       c2.customer_name  as customer,
       m.model_name         as model,
       market_price   as market_price,
       price_sold     as price_sold,
       transaction_date
from Transaction t
left join car c on c.car_id = t.car_id
left join customer c2 on c2.customer_id = t.customer_id
left join salesperson s on s.salesperson_id = t.salesperson_id
left join model m on c.model_id = m.model_id