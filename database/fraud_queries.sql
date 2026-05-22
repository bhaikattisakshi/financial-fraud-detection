-- Detect Transactions Above 5 Lakhs
SELECT *
FROM transactions
WHERE amount > 500000;

-- Detect Midnight Fraud Activity
SELECT *
FROM transactions
WHERE HOUR(transaction_time)
BETWEEN 1 AND 4;

-- Accounts With Repeated Failed Transactions
SELECT sender_account,
COUNT(*) AS failed_attempts
FROM transactions
WHERE status='FAILED'
GROUP BY sender_account
HAVING COUNT(*) >= 2;
