USE customer_churn_analysis;

SHOW TABLES;

RENAME TABLE customer_churn_final_analysis
TO customer_churn;

SELECT COUNT(*)
FROM customer_churn;

# 1 What is the overall customer churn situation?

SELECT
    COUNT(*) AS Total_Customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS Churned_Customers,

    SUM(CASE
        WHEN Churn = 'No' THEN 1
        ELSE 0
    END) AS Retained_Customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate,

    ROUND(
        SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Retention_Rate

FROM customer_churn;



# 2 Which customer segments have the highest churn rates?

SELECT
    'Gender' AS Customer_Segment,
    gender AS Segment_Value,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY gender

UNION ALL

SELECT
    'Senior Citizen',
    CASE WHEN SeniorCitizen = 1 THEN 'Yes' ELSE 'No' END,
    COUNT(*),
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END),
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    )
FROM customer_churn
GROUP BY SeniorCitizen

UNION ALL

SELECT
    'Partner',
    Partner,
    COUNT(*),
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END),
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    )
FROM customer_churn
GROUP BY Partner

UNION ALL

SELECT
    'Dependents',
    Dependents,
    COUNT(*),
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END),
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    )
FROM customer_churn
GROUP BY Dependents

ORDER BY Churn_Rate DESC;


# 3 Which tenure group has the highest customer churn?

SELECT
    TenureGroup,
    COUNT(*) AS Total_Customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS Churned_Customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate

FROM customer_churn

GROUP BY TenureGroup

ORDER BY Churn_Rate DESC;


# 4 Which contract type has the highest churn rate?

SELECT
    Contract,
    COUNT(*) AS Total_Customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS Churned_Customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate

FROM customer_churn

GROUP BY Contract

ORDER BY Churn_Rate DESC;


# 5 Which internet service type has the highest churn rate?

SELECT
    InternetService,
    COUNT(*) AS Total_Customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS Churned_Customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate

FROM customer_churn

GROUP BY InternetService

ORDER BY Churn_Rate DESC;

# 6 Which payment method has the highest customer churn?

SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS Churned_Customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate

FROM customer_churn

GROUP BY PaymentMethod

ORDER BY Churn_Rate DESC;


# 7 Does Tech Support influence customer churn?

SELECT
    TechSupport,
    COUNT(*) AS Total_Customers,
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY TechSupport
ORDER BY Churn_Rate DESC;

# 8 Does Online Security affect customer churn?

SELECT
    OnlineSecurity,
    COUNT(*) AS Total_Customers,
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY OnlineSecurity
ORDER BY Churn_Rate DESC;

# 9 Does Online Backup affect customer churn?

SELECT
    OnlineBackup,
    COUNT(*) AS Total_Customers,
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY OnlineBackup
ORDER BY Churn_Rate DESC;


# 10 Does Device Protection affect customer churn?

SELECT
    DeviceProtection,
    COUNT(*) AS Total_Customers,
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY DeviceProtection
ORDER BY Churn_Rate DESC;


# 11 Does Paperless Billing affect customer churn?

SELECT
    PaperlessBilling,
    COUNT(*) AS Total_Customers,
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY PaperlessBilling
ORDER BY Churn_Rate DESC;


# 12 Does Monthly Charges level affect customer churn?

SELECT
    MonthlyChargesGroup,
    COUNT(*) AS Total_Customers,
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate,
    ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charges
FROM customer_churn
GROUP BY MonthlyChargesGroup
ORDER BY Churn_Rate DESC;


# 13 Which contract and internet service combination has the highest churn?

SELECT
    Contract,
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY Contract, InternetService
ORDER BY Churn_Rate DESC;


# 14 Which customer tenure and contract combination has the highest churn?

SELECT
    TenureGroup,
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY TenureGroup, Contract
ORDER BY Churn_Rate DESC;

# 15 Which customer segment generates the highest revenue?

SELECT
    Churn,
    COUNT(*) AS Total_Customers,
    ROUND(SUM(TotalCharges), 2) AS Total_Revenue,
    ROUND(AVG(TotalCharges), 2) AS Average_Revenue_Per_Customer,
    ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charges
FROM customer_churn
GROUP BY Churn
ORDER BY Total_Revenue DESC;

# 16 What is the average customer lifetime value by contract type?


SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(TotalCharges), 2) AS Average_Customer_Revenue,
    ROUND(SUM(TotalCharges), 2) AS Total_Revenue,
    ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charges,
    ROUND(
        SUM(TotalCharges) / COUNT(*), 2
    ) AS Average_Revenue_Per_Customer
FROM customer_churn
GROUP BY Contract
ORDER BY Average_Customer_Revenue DESC;


# 17 Which customer tenure group generates the highest revenue?

SELECT
    TenureGroup,
    COUNT(*) AS Total_Customers,
    ROUND(SUM(TotalCharges), 2) AS Total_Revenue,
    ROUND(AVG(TotalCharges), 2) AS Average_Revenue_Per_Customer,
    ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charges
FROM customer_churn
GROUP BY TenureGroup
ORDER BY Average_Revenue_Per_Customer DESC;


# 18 Which services generate the highest churn rate?

SELECT
    'Streaming TV' AS Service,
    StreamingTV AS Service_Status,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY StreamingTV

UNION ALL

SELECT
    'Streaming Movies',
    StreamingMovies,
    COUNT(*),
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END),
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    )
FROM customer_churn
GROUP BY StreamingMovies

UNION ALL

SELECT
    'Multiple Lines',
    MultipleLines,
    COUNT(*),
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END),
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    )
FROM customer_churn
GROUP BY MultipleLines

ORDER BY Churn_Rate DESC;

# 19 Which customer groups have the highest monthly charges and churn?

SELECT
    MonthlyChargesGroup,
    Churn,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charges,
    ROUND(AVG(TotalCharges), 2) AS Average_Total_Charges
FROM customer_churn
GROUP BY MonthlyChargesGroup, Churn
ORDER BY MonthlyChargesGroup, Churn;


# 20 Which payment method generates the highest revenue?


SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    ROUND(SUM(TotalCharges), 2) AS Total_Revenue,
    ROUND(AVG(TotalCharges), 2) AS Average_Revenue_Per_Customer,
    ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charges
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY Total_Revenue DESC;


# 21 Which customer segments contribute the highest revenue?

SELECT
    'Senior Citizen' AS Customer_Segment,
    SeniorCitizen AS Segment_Status,
    COUNT(*) AS Total_Customers,
    ROUND(SUM(TotalCharges), 2) AS Total_Revenue,
    ROUND(AVG(TotalCharges), 2) AS Average_Revenue_Per_Customer
FROM customer_churn
GROUP BY SeniorCitizen

UNION ALL

SELECT
    'Partner',
    Partner,
    COUNT(*),
    ROUND(SUM(TotalCharges), 2),
    ROUND(AVG(TotalCharges), 2)
FROM customer_churn
GROUP BY Partner

UNION ALL

SELECT
    'Dependents',
    Dependents,
    COUNT(*),
    ROUND(SUM(TotalCharges), 2),
    ROUND(AVG(TotalCharges), 2)
FROM customer_churn
GROUP BY Dependents

ORDER BY Average_Revenue_Per_Customer DESC;


# 22 Which internet service contributes the highest revenue?

SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    ROUND(SUM(TotalCharges), 2) AS Total_Revenue,
    ROUND(AVG(TotalCharges), 2) AS Average_Revenue_Per_Customer,
    ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charges
FROM customer_churn
GROUP BY InternetService
ORDER BY Total_Revenue DESC;


# 23 Which contract and payment method combinations have the highest churn?

SELECT
    Contract,
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY Contract, PaymentMethod
ORDER BY Churn_Rate DESC;


# 24 Identify High-Risk Customer Segments

SELECT
    Contract,
    InternetService,
    TenureGroup,
    COUNT(*) AS Total_Customers,
    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY
    Contract,
    InternetService,
    TenureGroup
HAVING COUNT(*) >= 30
ORDER BY Churn_Rate DESC;

# 25 Rank Customers by Total Revenue Using Window Functions

SELECT
    customerID,
    Contract,
    InternetService,
    Tenure,
    TotalCharges,
    ROW_NUMBER() OVER (
        ORDER BY TotalCharges DESC
    ) AS Revenue_Rank
FROM customer_churn
ORDER BY Revenue_Rank
LIMIT 20;


# 26 Rank Customers Within Each Contract Type

SELECT
    customerID,
    Contract,
    InternetService,
    Tenure,
    TotalCharges,
    ROW_NUMBER() OVER (
        PARTITION BY Contract
        ORDER BY TotalCharges DESC
    ) AS Contract_Revenue_Rank
FROM customer_churn
ORDER BY Contract, Contract_Revenue_Rank
LIMIT 30;


# 27 Calculate Average Revenue and Compare Each Customer Against Their Contract Average

SELECT
    customerID,
    Contract,
    Tenure,
    TotalCharges,

    ROUND(
        AVG(TotalCharges) OVER (
            PARTITION BY Contract
        ), 2
    ) AS Contract_Average_Revenue,

    ROUND(
        TotalCharges -
        AVG(TotalCharges) OVER (
            PARTITION BY Contract
        ), 2
    ) AS Difference_From_Average

FROM customer_churn
ORDER BY Difference_From_Average DESC
LIMIT 20;


# 28 Create a Customer Churn Risk Classification Using CASE


SELECT
    Risk_Category,
    COUNT(*) AS Total_Customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS Churned_Customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Actual_Churn_Rate

FROM (
    SELECT
        customerID,
        Churn,

        CASE
            WHEN Contract = 'Month-to-month'
                 AND Tenure <= 12
                THEN 'High Risk'

            WHEN Contract = 'Month-to-month'
                 AND Tenure > 12
                THEN 'Medium Risk'

            ELSE 'Low Risk'
        END AS Risk_Category

    FROM customer_churn
) AS Customer_Risk

GROUP BY Risk_Category

ORDER BY Actual_Churn_Rate DESC;

# 29 Build a Reusable SQL View for Customer Churn Analysis

CREATE OR REPLACE VIEW customer_churn_risk_view AS

SELECT
    customerID,
    Gender,
    SeniorCitizen,
    Partner,
    Dependents,
    Tenure,
    Contract,
    InternetService,
    PaymentMethod,
    MonthlyCharges,
    TotalCharges,
    Churn,

    CASE
        WHEN Contract = 'Month-to-month'
             AND Tenure <= 12
            THEN 'High Risk'

        WHEN Contract = 'Month-to-month'
             AND Tenure > 12
            THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS Risk_Category

FROM customer_churn;

# 30 Create a Business Summary Using the SQL View

SELECT
    COUNT(*) AS Total_Customers,

    SUM(CASE
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END) AS Total_Churned,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS Overall_Churn_Rate,

    SUM(CASE
        WHEN Risk_Category = 'High Risk' THEN 1
        ELSE 0
    END) AS High_Risk_Customers,

    SUM(CASE
        WHEN Risk_Category = 'Medium Risk' THEN 1
        ELSE 0
    END) AS Medium_Risk_Customers,

    SUM(CASE
        WHEN Risk_Category = 'Low Risk' THEN 1
        ELSE 0
    END) AS Low_Risk_Customers,

    ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charges,

    ROUND(SUM(TotalCharges), 2) AS Total_Historical_Revenue

FROM customer_churn_risk_view;