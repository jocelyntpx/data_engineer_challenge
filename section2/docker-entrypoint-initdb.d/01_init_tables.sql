create table Manufacturer
(
    manufacturer_id BIGINT PRIMARY KEY,
    manufacturer_name  TEXT
);
create table Model
(
    model_id  BIGINT PRIMARY KEY,
    manufacturer_id BIGINT REFERENCES Manufacturer,
    model_name   TEXT,
    model_weight  INT,
    market_price  INT 
);
create table Car
(
    car_id        BIGINT PRIMARY KEY,
    model_id      BIGINT REFERENCES Model,
    serial_number BIGINT
);
create table Salesperson
(
    salesperson_id BIGINT PRIMARY KEY,
    salesperson_name TEXT
);
create table Customer
(
    customer_id BIGINT PRIMARY KEY,
    customer_name TEXT,
    customer_phone INT
);
create table Transaction
(
    transaction_id   BIGINT PRIMARY KEY,
    salesperson_id   BIGINT REFERENCES Salesperson,
    customer_id      BIGINT REFERENCES Customer,
    car_id           BIGINT REFERENCES Car,
    price_sold       INT,
    transaction_date DATE,
    transaction_time TIME
);
