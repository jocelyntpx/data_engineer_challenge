# Section 2

## Instructions on running db

1. To build image, run `docker build -t section2 .`
2. To run a temporary container run : `docker run --rm -p 5432 section2` 
3. You can now access your db at localhost:5432

## Files
- docker-entrypoint-initdb.d/01_init_tables.sql: table creation
- docker-entrypoint-initdb.d/01_init_views.sql: view creation (example usage)
- tasks.sql: sql statement for required tasks

## Rationales

 - Decision 1: Split car into car, model, manufacturer as opposed to storing all in one car table. 
   - Reason 1: This is to reduce data redundancies which could result in incorrect data. e.g. if manufacturer changes, we may have to update all manufacturers with the same name, which could be error prone. 
   - Reason 2: It is also to have a clearer and simpler base tables where users can easily retrieve from the different tables based on what they need. When they have a set of data they would like to view frequently (from multiple tables), we can then build view tables according to what they need so that they don't have to query over and over again by themselves each time. View table do not store the data so that do not really take up much additional storage cost. (see below under 'Good to haves' to see an example)
   - Reason 3: This may also help reduce query cost as compared to when we have a very large table with a lot of attributes inside and users just "select * from table" without considering what they need before making such a heavy query.

 - Decision 2: Having a market_price linked to the car, and a price_sold linked to the transaction. This is to accommodate to cases where negotiations take place when dealing, and also might help higher management keep track of who is giving out the most discounts.


## Good to haves

 - TransactionHistory view : for higher management to see a human readable form of the past transactions
   - idle execution to be run daily

 ```
    -- Some useful queries

    -- See human readable transaction history.
    select * from TransactionHistory;

    -- Get Revenue from 1st April to 1st November
    select sum(price_sold)
    from transactionhistory
    where transaction_time between '04/1/2022' and '11/1/2022';

    -- Get Monthly Revenue
    select date_part('month', date_trunc('month', transaction_time)) as month, sum(price_sold)
    from transactionhistory
    group by date_trunc('month', transaction_time);
 ```
