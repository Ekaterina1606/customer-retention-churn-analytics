CREATE OR REPLACE TABLE customers AS
SELECT *
FROM read_csv_auto('WA_Fn-UseC_-Telco-Customer-Churn.csv');

-- 1. Customer base and churn rate
SELECT
    COUNT(*) AS total_customers,
    COUNT(*) FILTER (WHERE Churn = 'Yes') AS churned_customers,
    COUNT(*) FILTER (WHERE Churn = 'No') AS retained_customers,
    ROUND(100.0 * COUNT(*) FILTER (WHERE Churn = 'Yes') / COUNT(*), 2) AS churn_rate_pct
FROM customers;

-- 2. Churn rate by contract type
SELECT
    Contract AS contract_type,
    COUNT(*) AS customers,
    COUNT(*) FILTER (WHERE Churn = 'Yes') AS churned_customers,
    ROUND(100.0 * COUNT(*) FILTER (WHERE Churn = 'Yes') / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY Contract
ORDER BY churn_rate_pct DESC;

-- 3. Churn rate by tenure group (months)
WITH tenure_segments AS (
    SELECT
        Churn,
        CASE
            WHEN tenure BETWEEN 0 AND 6 THEN '0-6 months'
            WHEN tenure BETWEEN 7 AND 12 THEN '7-12 months'
            WHEN tenure BETWEEN 13 AND 24 THEN '13-24 months'
            WHEN tenure BETWEEN 25 AND 48 THEN '25-48 months'
            ELSE '49+ months'
        END AS tenure_group,
        CASE
            WHEN tenure BETWEEN 0 AND 6 THEN 1
            WHEN tenure BETWEEN 7 AND 12 THEN 2
            WHEN tenure BETWEEN 13 AND 24 THEN 3
            WHEN tenure BETWEEN 25 AND 48 THEN 4
            ELSE 5
        END AS tenure_order
    FROM customers
)
SELECT
    tenure_group,
    COUNT(*) AS customers,
    ROUND(100.0 * COUNT(*) FILTER (WHERE Churn = 'Yes') / COUNT(*), 2) AS churn_rate_pct
FROM tenure_segments
GROUP BY tenure_group, tenure_order
ORDER BY tenure_order;

-- 4. Churn rate by payment method
SELECT
    PaymentMethod AS payment_method,
    COUNT(*) AS customers,
    ROUND(100.0 * COUNT(*) FILTER (WHERE Churn = 'Yes') / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate_pct DESC;

-- 5. Monthly charges and churn-related monthly charges
SELECT
    ROUND(SUM(MonthlyCharges), 2) AS total_monthly_charges_usd,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge_usd,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN MonthlyCharges ELSE 0 END), 2)
        AS churned_customers_monthly_charges_usd
FROM customers;

-- 6. Customer segments: internet service and technical support
SELECT
    InternetService AS internet_service,
    TechSupport AS tech_support,
    COUNT(*) AS customers,
    COUNT(*) FILTER (WHERE Churn = 'Yes') AS churned_customers,
    ROUND(100.0 * COUNT(*) FILTER (WHERE Churn = 'Yes') / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY InternetService, TechSupport
ORDER BY churn_rate_pct DESC, customers DESC;
