CREATE TABLE Manufacturer
(
    manufacturer_id BIGINT PRIMARY KEY,
    manufacturer_name  TEXT
);
CREATE TABLE Model
(
    model_id  BIGINT PRIMARY KEY,
    manufacturer_id BIGINT REFERENCES Manufacturer,
    model_name   TEXT,
    model_weight  INT,
    market_price  INT 
);
CREATE TABLE Car
(
    car_id        BIGINT PRIMARY KEY,
    model_id      BIGINT REFERENCES Model,
    serial_number BIGINT
);
CREATE TABLE Salesperson
(
    salesperson_id BIGINT PRIMARY KEY,
    salesperson_name TEXT
);
CREATE TABLE Customer
(
    customer_id BIGINT PRIMARY KEY,
    customer_name TEXT,
    customer_phone INT
);
CREATE TABLE Transaction
(
    transaction_id   BIGINT PRIMARY KEY,
    salesperson_id   BIGINT REFERENCES Salesperson,
    customer_id      BIGINT REFERENCES Customer,
    car_id           BIGINT REFERENCES Car,
    price_sold       INT,
    transaction_date DATE,
    transaction_time TIME
);
