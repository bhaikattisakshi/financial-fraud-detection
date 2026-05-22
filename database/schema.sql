CREATE DATABASE fraud_detection;

USE fraud_detection;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);
