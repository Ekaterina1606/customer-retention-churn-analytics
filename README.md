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

Explore the full interactive project on [Tableau Public](https://public.tableau.com/app/profile/sophia.bank/viz/CustomerRetentionChurnAnalytics/Dashboard1).

### 1. Customer Churn Overview

![Customer Churn Overview](screenshots/Dashboard%201.png)

This dashboard presents key churn metrics and analyzes customer churn by contract type, tenure, and payment method.

### 2. Customer Segmentation

![Customer Segmentation](screenshots/Dashboard%202.png)

This dashboard explores churn patterns across internet service types, online security, technical support, and senior citizen segments.

### 3. Revenue & Retention Opportunities

![Revenue & Retention Opportunities](screenshots/Dashboard%203.png)

This dashboard examines monthly charges, charges associated with churned customers, and revenue-related patterns across customer segments.

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
