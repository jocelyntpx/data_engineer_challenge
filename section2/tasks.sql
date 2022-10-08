-- TASKS

-- 1. I want to know the list of our customers and their spending.
select customer_id, customer_name, coalesce(sum(price_sold),0) as money_spent
from customer c
left join transaction t on c.customer_id = t.customer_id
group by c.customer_id, c.customer_name;

-- 2. I want to find out the top 3 car manufacturers that customers bought by sales (quantity) and the sales number for it in the current month.
select m2.name, count(transaction_id) as sales
from transaction
left join car c on transaction.car_id = c.car_id
left join model m on c.model_id = m.model_id
left join manufacturer m2 on m.manufacturer_id = m2.manufacturer_id
group by m2.name order by sales limit 3
