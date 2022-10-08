create table Manufacturer
(
    manufacturer_id bigint primary key,
    manufacturer_name  text
);
create table Model
(
    model_id  bigint primary key,
    manufacturer_id bigint references Manufacturer,
    model_name   text,
    model_weight  int,
    market_price  int 
);
create table Car
(
    car_id        bigint primary key,
    model_id      bigint references Model,
    serial_number bigint
);
create table Salesperson
(
    salesperson_id bigint primary key,
    salesperson_name text
);
create table Customer
(
    customer_id bigint primary key,
    customer_name text,
    customer_phone int
);
create table Transaction
(
    transaction_id   bigint primary key,
    salesperson_id   bigint references Salesperson,
    customer_id      bigint references Customer,
    car_id           bigint references Car,
    price_sold       int,
    transaction_date date,
    transaction_time time
);
