CREATE TABLE Manufacturer
(
    manufacturer_id bigint primary key,
    manufacturer_name  text
);
CREATE TABLE Model
(
    model_id  bigint primary key,
    manufacturer_id bigint references Manufacturer,
    model_name   text,
    model_weight  int,
    market_price  int 
);
CREATE TABLE Car
(
    car_id        bigint primary key,
    model_id      bigint references Model,
    serial_number bigint
);
CREATE TABLE Salesperson
(
    salesperson_id bigint primary key,
    salesperson_name text
);
CREATE TABLE Customer
(
    customer_id bigint primary key,
    customer_name text,
    customer_phone int
);
CREATE TABLE Transaction
(
    transaction_id   bigint primary key,
    salesperson_id   bigint references Salesperson,
    customer_id      bigint references Customer,
    car_id           bigint references Car,
    price_sold       int,
    transaction_date date,
    transaction_time time
);
