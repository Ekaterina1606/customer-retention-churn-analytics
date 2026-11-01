-- 1. Check customer uniqueness and missing values
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT customerID) AS unique_customers,
    COUNT(*) - COUNT(DISTINCT customerID) AS duplicate_customers,
    COUNT(*) FILTER (WHERE customerID IS NULL) AS missing_customer_ids,
    COUNT(*) FILTER (WHERE TotalCharges IS NULL) AS missing_total_charges,
    COUNT(*) FILTER (WHERE is_churned IS NULL) AS missing_churn_flags
FROM mart_customer_churn;

-- 2. Validate key churn KPIs
SELECT
    COUNT(*) AS total_customers,
    SUM(is_churned) AS churned_customers,
    ROUND(100.0 * AVG(is_churned), 2) AS churn_rate_pct
FROM mart_customer_churn;

-- 3. Check customer segments
SELECT
    tenure_group,
    COUNT(*) AS total_customers,
    SUM(is_churned) AS churned_customers,
    ROUND(100.0 * AVG(is_churned), 2) AS churn_rate_pct
FROM mart_customer_churn
GROUP BY tenure_group
ORDER BY
    CASE tenure_group
        WHEN '0-6 months' THEN 1
        WHEN '7-12 months' THEN 2
        WHEN '13-24 months' THEN 3
        WHEN '25-48 months' THEN 4
        WHEN '49+ months' THEN 5
        ELSE 6
    END;
