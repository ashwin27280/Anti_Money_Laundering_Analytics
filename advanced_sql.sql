--ADVANCED SQL

-- 1. Customers Spending Above Average (CTE)
WITH customer_total AS
(
    SELECT
        customer_id,
        customer_name,
        SUM(amount) AS total_amount
    FROM transactions
    GROUP BY customer_id, customer_name
)

SELECT *
FROM customer_total
WHERE total_amount >
(
    SELECT AVG(total_amount)
    FROM customer_total
);


-- 2. Region-wise Total Transaction Amount (CTE)
WITH region_total AS
(
    SELECT
        customer_region,
        SUM(amount) AS total_amount
    FROM transactions
    GROUP BY customer_region
)

SELECT *
FROM region_total
ORDER BY total_amount DESC;



-- 3. Rank Customers by Total Spending
SELECT
    customer_id,
    customer_name,
    SUM(amount) AS total_amount,

    RANK() OVER
    (
        ORDER BY SUM(amount) DESC
    ) AS customer_rank

FROM transactions
GROUP BY customer_id, customer_name;


-- 4. Dense Rank Banks by Transaction Amount
SELECT
    bank_name,
    SUM(amount) AS total_amount,

    DENSE_RANK() OVER
    (
        ORDER BY SUM(amount) DESC
    ) AS bank_rank

FROM transactions
GROUP BY bank_name;



-- 5. Row Number Within Each Region
SELECT
    customer_region,
    customer_name,
    amount,

    ROW_NUMBER() OVER
    (
        PARTITION BY customer_region
        ORDER BY amount DESC
    ) AS region_rank

FROM transactions;



-- 6. Running Total of Transactions
SELECT
    transaction_date,
    amount,

    SUM(amount) OVER
    (
        ORDER BY transaction_date
    ) AS running_total

FROM transactions;



-- 7. 7-Day Moving Average
SELECT
    transaction_date,
    amount,

    ROUND
    (
        AVG(amount) OVER
        (
            ORDER BY transaction_date
            ROWS BETWEEN 6 PRECEDING
            AND CURRENT ROW
        ),
        2
    ) AS moving_average

FROM transactions;



-- 8. Previous Transaction Amount (LAG)
SELECT
    customer_id,
    transaction_date,
    amount,

    LAG(amount) OVER
    (
        PARTITION BY customer_id
        ORDER BY transaction_date
    ) AS previous_amount

FROM transactions;


-- 9. Next Transaction Amount (LEAD)
SELECT
    customer_id,
    transaction_date,
    amount,

    LEAD(amount) OVER
    (
        PARTITION BY customer_id
        ORDER BY transaction_date
    ) AS next_amount

FROM transactions;


-- 10. Categorize Transactions Using CASE
SELECT
    customer_name,
    amount,

    CASE
        WHEN amount >= 10000 THEN 'High'
        WHEN amount >= 5000 THEN 'Medium'
        ELSE 'Low'
    END AS transaction_category

FROM transactions;


-- 11. Transactions Above Average Amount
SELECT *
FROM transactions
WHERE amount >
(
    SELECT AVG(amount)
    FROM transactions
);


-- 12. Top Customer in Each Region
WITH customer_amount AS
(
    SELECT
        customer_region,
        customer_id,
        customer_name,
        SUM(amount) AS total_amount

    FROM transactions

    GROUP BY
        customer_region,
        customer_id,
        customer_name
),

ranking AS
(
    SELECT
        *,

        ROW_NUMBER() OVER
        (
            PARTITION BY customer_region
            ORDER BY total_amount DESC
        ) AS rn

    FROM customer_amount
)

SELECT *
FROM ranking
WHERE rn = 1;