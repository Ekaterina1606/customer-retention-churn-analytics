# Customer Retention & Churn Analytics

## Project Overview

This project analyzes customer churn, customer segments, and monthly charges using the Telco Customer Churn dataset.

The goal is to identify customer groups associated with higher churn rates, explore revenue-related retention opportunities, and communicate findings through interactive Tableau dashboards and SQL analysis.

## Tools & Technologies

- **Tableau Public** — interactive dashboards, KPI calculations, and customer segmentation
- **SQL (DuckDB-compatible)** — analytical queries for customer churn and revenue metrics
- **GitHub** — project documentation and SQL code

## Dataset

**Dataset:** Telco Customer Churn

The dataset contains 7,043 customer records and 21 columns, including contract type, tenure, payment method, internet service, monthly charges, and churn status.

## Interactive Tableau Dashboards

[**View the Tableau Project**](https://public.tableau.com/app/profile/sophia.bank/viz/CustomerRetentionChurnAnalytics/Dashboard1)

The Tableau workbook contains three interactive dashboards:

### 1. Customer Churn Overview

- Total customers and overall churn rate
- Monthly charges associated with churned customers
- Churn by contract type, tenure, and payment method
- Interactive contract filter

### 2. Customer Segmentation

- Churn by internet service type
- Churn by online security subscription
- Churn by technical support subscription
- Churn comparison between senior and non-senior customers

### 3. Revenue & Retention Opportunities

- Total and average monthly charges
- Monthly charges associated with churned customers
- Revenue-related metrics by contract type
- Average monthly charges by churn status

## Key Performance Indicators

| Metric | Value |
|---|---:|
| Total Customers | 7,043 |
| Churned Customers | 1,869 |
| Churn Rate | 26.54% |
| Total Monthly Charges | $456,116.60 |
| Average Monthly Charges | $64.76 |
| Monthly Charges of Churned Customers | $139,130.85 |

*Note: Monthly charges represent amounts recorded in the dataset, not verified revenue for a specific calendar month. The charges associated with churned customers are a descriptive measure, not confirmed realized revenue loss.*

## Key Insights

1. **Contract type:** Month-to-month customers have a substantially higher churn rate (42.7%) than customers with one-year (11.3%) or two-year contracts (2.8%).
2. **Customer tenure:** Customers with 0–6 months of tenure have a churn rate of approximately 52.9%, compared with 9.5% for customers with 49+ months of tenure.
3. **Payment method:** Customers using electronic checks have the highest observed churn rate among payment methods (45.3%).
4. **Internet service:** Fiber optic customers have a churn rate of approximately 41.9%, compared with 19.0% for DSL customers.
5. **Monthly charges:** Customers who churned have higher average monthly charges (approximately $74.44) than customers who stayed (approximately $61.27).

These findings describe associations in the dataset and do not establish causation.

## SQL Analysis

The project includes analytical SQL queries covering:

- Overall customer counts and churn rates
- Churn by contract type
- Churn by tenure
- Churn by payment method
- Monthly charges and churn-related revenue metrics
- Customer segments associated with higher churn

**SQL file:** [churn_analysis.sql](churn_analysis.sql)

## Business Recommendations

Based on the observed patterns, potential areas for further investigation include:

- Developing onboarding and retention initiatives for newer customers
- Evaluating retention offers for month-to-month subscribers
- Investigating customer experience and pricing perceptions among fiber optic subscribers
- Examining the relationship between payment methods and customer churn

These are hypotheses for future testing rather than proven interventions.

## Project Deliverables

- Three interactive Tableau dashboards
- SQL analytical queries
- Business insights and recommendations
- GitHub project documentation
