-- 1. Load source dataset
CREATE OR REPLACE TABLE customers AS
SELECT *
FROM read_csv_auto(
    'WA_Fn-UseC_-Telco-Customer-Churn.csv'
);

-- 2. Create customer-level analytical mart
CREATE OR REPLACE TABLE mart_customer_churn AS
WITH prepared AS (
    SELECT
        customerID,
        Contract,
        tenure,
        InternetService,
        TechSupport,
        PaymentMethod,
        TRY_CAST(MonthlyCharges AS DOUBLE) AS MonthlyCharges,

        TRY_CAST(
            NULLIF(TRIM(CAST(TotalCharges AS VARCHAR)), '')
            AS DOUBLE
        ) AS TotalCharges,

        CASE
            WHEN Churn = 'Yes' THEN 1
            WHEN Churn = 'No' THEN 0
            ELSE NULL
        END AS is_churned,

        CASE
            WHEN tenure BETWEEN 0 AND 6 THEN '0-6 months'
            WHEN tenure BETWEEN 7 AND 12 THEN '7-12 months'
            WHEN tenure BETWEEN 13 AND 24 THEN '13-24 months'
            WHEN tenure BETWEEN 25 AND 48 THEN '25-48 months'
            WHEN tenure >= 49 THEN '49+ months'
            ELSE 'Unknown'
        END AS tenure_group
    FROM customers
)
SELECT
    *,
    CASE
        WHEN is_churned = 1 THEN MonthlyCharges
        WHEN is_churned = 0 THEN 0
        ELSE NULL
    END AS churned_monthly_charges
FROM prepared;
