# Customer Churn Analysis

## Project Overview
Customer churn is a major challenge for subscription-based businesses. This project analyses customer data from a telecommunications company to identify the factors associated with customer churn, understand customer behaviour, and highlight high-risk customer segments.

The analysis uses Python and MySQL to explore customer demographics, subscription details, service usage, payment methods, revenue, and churn patterns.

## Project Objectives
- Analyse overall customer churn and retention rates.
- Identify customer segments with high churn rates.
- Understand the relationship between contract types, tenure, services, and churn.
- Analyse historical customer revenue and payment methods.
- Identify high-risk customer segments.
- Develop business recommendations to improve customer retention.

## Tools & Technologies
- **Python:** Data cleaning, exploratory data analysis (EDA), and visualisation.
- **Pandas & NumPy:** Data manipulation and analysis.
- **Matplotlib & Seaborn:** Data visualisation.
- **MySQL:** SQL-based business analysis.
- **Jupyter Notebook:** Python analysis environment.

## Dataset
- Dataset: IBM Telco Customer Churn
- Total Records: 7,043 customers
- Original Columns: 21
- Final Analysis Columns: 23

The dataset was cleaned and prepared before analysis. Missing values in `TotalCharges` were handled, and additional customer segments were created for tenure and monthly charges.

## Project Structure

```text
Customer-Churn-Analysis/
│
├── 01_notebooks/
│   └── Customer_Churn_Analysis.ipynb
│
├── 02_sql/
│   └── Customer-Churn-Analysis.sql
│
├── 03_data/
│   └── Customer_Churn_Final_Analysis.csv
│
├── 04_reports/
│
└── README.md
```

## Analysis Performed

### Python Analysis
- Data cleaning and preprocessing
- Missing value and duplicate checks
- Customer demographics analysis
- Tenure and contract analysis
- Internet service and payment method analysis
- Revenue and monthly charges analysis
- Service add-on analysis
- Customer churn visualisation
- Correlation analysis

### SQL Analysis
30 business-focused SQL queries covering:
- Overall churn and retention
- Customer segment analysis
- Tenure and contract churn
- Internet service and payment method analysis
- Revenue analysis
- High-risk customer identification
- Customer ranking using window functions
- CASE statements and risk classification
- SQL views and final business summary

## Key Findings

| Business Metric | Result |
|---|---:|
| Total Customers | 7,043 |
| Churned Customers | 1,869 |
| Retained Customers | 5,174 |
| Overall Churn Rate | 26.54% |
| Retention Rate | 73.46% |

### Important Insights

1. **Contract Type:** Month-to-month customers have the highest churn rate at 42.71%, compared with 2.83% for two-year contracts.

2. **Customer Tenure:** Customers in their first 12 months have a churn rate of 47.44%.

3. **Internet Service:** Fiber optic customers have a churn rate of 41.89%, higher than DSL customers at 18.96%.

4. **Payment Method:** Electronic check customers have the highest churn rate at 45.29%.

5. **Technical Support:** Customers without tech support have a churn rate of 41.64%, compared with 15.17% among customers with tech support.

6. **High-Risk Segment:** Month-to-month customers using fiber optic services with 0–12 months of tenure have the highest identified segment churn rate of 70.20%.

## Customer Risk Classification

Customers were classified using SQL CASE statements:

- **High Risk:** Month-to-month contract with tenure of 12 months or less.
- **Medium Risk:** Month-to-month contract with tenure above 12 months.
- **Low Risk:** One-year or two-year contract.

| Risk Category | Customers | Actual Churn Rate |
|---|---:|---:|
| High Risk | 1,994 | 51.35% |
| Medium Risk | 1,881 | 33.55% |
| Low Risk | 3,168 | 6.76% |

*Note: These are rule-based risk categories, not machine learning predictions.*

## Business Recommendations

- Introduce onboarding and retention programmes for new customers.
- Encourage customers to move from month-to-month to longer-term contracts.
- Investigate service quality and pricing concerns among fiber optic customers.
- Improve customer support and promote technical support services.
- Review the electronic check payment experience.
- Prioritise retention campaigns for high-risk customer segments.

## Conclusion

This project demonstrates how Python and SQL can be used together to transform raw customer data into meaningful business insights. The analysis identifies important churn patterns, customer segments, and potential retention opportunities that can support data-driven business decisions.

---

**Project Category:** Data Analytics | Customer Churn Analysis  
**Tools:** Python | MySQL | Pandas | NumPy | Matplotlib | Seaborn
