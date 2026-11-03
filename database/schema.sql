
-- ==========================================
-- PROJECT: FINANCIAL TRANSACTION FRAUD DETECTION
-- DATABASE: MySQL
-- ==========================================

CREATE DATABASE IF NOT EXISTS fraud_detection;

USE fraud_detection;

-- 1. Customers Table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50)
);

-- 2. Transactions Table
CREATE TABLE IF NOT EXISTS transactions (
    transaction_id INT PRIMARY KEY,
    sender_account INT NOT NULL,
    receiver_account INT NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    transaction_time DATETIME NOT NULL,
    status ENUM('SUCCESS', 'FAILED') NOT NULL,
    location VARCHAR(100),

    CONSTRAINT chk_transaction_amount CHECK (amount > 0)
);

-- 3. Performance Indexes
CREATE INDEX idx_sender_account
ON transactions(sender_account);

CREATE INDEX idx_transaction_time
ON transactions(transaction_time);

CREATE INDEX idx_transaction_status
ON transactions(status);

CREATE INDEX idx_transaction_amount
ON transactions(amount);

-- 4. Verify Database Structure
SHOW TABLES;

DESCRIBE customers;
DESCRIBE transactions;
