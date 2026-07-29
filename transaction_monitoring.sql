CREATE TABLE transactions (

    transaction_id INT PRIMARY KEY,

    customer_id INT NOT NULL,

    customer_name VARCHAR(100),

    customer_email VARCHAR(100),

    customer_phone VARCHAR(30),

    customer_region VARCHAR(50),

    customer_risk_level VARCHAR(20),

    bank_id INT,

    bank_name VARCHAR(100),

    bank_region VARCHAR(50),

    bank_compliance_score NUMERIC(5,2),

    amount NUMERIC(15,2),

    currency VARCHAR(10),

    transaction_date TIMESTAMP,

    transaction_location VARCHAR(100),

    is_high_risk BOOLEAN,

    is_valid_bank_id BOOLEAN,

    amount_outlier BOOLEAN,

    transaction_count INT,

    avg_transaction_amount NUMERIC(15,2),

    max_transaction_amount NUMERIC(15,2),

    amount_deviation NUMERIC(15,2),

    large_transaction BOOLEAN,

    foreign_currency BOOLEAN,

    transaction_hour INT,

    weekend_transaction BOOLEAN,

    cross_region BOOLEAN,

    invalid_bank BOOLEAN,

    customer_risk_score INT,

    night_transaction BOOLEAN

);

SELECT * FROM transactions;

--1. Total Transactions
SELECT
COUNT(*) AS total_transactions
FROM transactions;

--2. Total Transaction Amount
SELECT
SUM(amount) AS total_amount
FROM transactions;


--3. Average Transaction Amount
SELECT
ROUND(AVG(amount),2) AS average_amount
FROM transactions;

--4. Region-wise Transaction Summary
SELECT
customer_region,
COUNT(*) AS total_transactions,
SUM(amount) AS total_amount,
ROUND(AVG(amount),2) AS average_amount
FROM transactions
GROUP BY customer_region
ORDER BY total_amount DESC;

--5. Top 10 Customers by Amount
SELECT
customer_id,
customer_name,
SUM(amount) AS total_amount
FROM transactions
GROUP BY customer_id, customer_name
ORDER BY total_amount DESC
LIMIT 10;

--6. Top Banks by Transaction Volume
SELECT
bank_name,
COUNT(*) AS total_transactions,
SUM(amount) AS total_amount
FROM transactions
GROUP BY bank_name
ORDER BY total_transactions DESC;

--7. Currency-wise Transactions
SELECT
currency,
COUNT(*) AS total_transactions,
SUM(amount) AS total_amount
FROM transactions
GROUP BY currency;

--8. Daily Transaction Trend
SELECT
DATE(transaction_date) AS transaction_day,
COUNT(*) AS total_transactions,
SUM(amount) AS total_amount
FROM transactions
GROUP BY DATE(transaction_date)
ORDER BY transaction_day;

--9. High Risk Customer Distribution
SELECT
customer_risk_level,
COUNT(*) AS customers
FROM transactions
GROUP BY customer_risk_level;

--10. Bank Compliance Summary
SELECT
bank_name,
ROUND(AVG(bank_compliance_score),2) AS compliance_score,
COUNT(*) AS total_transactions
FROM transactions
GROUP BY bank_name
ORDER BY compliance_score;


