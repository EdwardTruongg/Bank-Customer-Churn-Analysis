# Bank-Customer-Churn-Analysis

## Overview
This project analyzes a bank customer dataset to identify key factors 
driving customer churn. SQL was used to calculate churn rates across 
different customer segments, and Tableau was used to build an interactive 
dashboard highlighting the strongest predictors of churn.

## Dashboard Preview
<img width="1918" height="1055" alt="image" src="https://github.com/user-attachments/assets/817443ca-9212-4f52-ae6d-40f76920a59d" />

[[View Interactive Dashboard on Tableau Public]](https://public.tableau.com/app/profile/edward.truong/viz/BankCustomerChurnAnalysis_17812475821060/Dashboard1)

## Tools Used
- Microsoft SQL Server / T-SQL
- Tableau Public

## Dataset
Source: Kaggle — Customer Churn Records
Link: https://www.kaggle.com/datasets/radheshyamkollipara/bank-customer-churn

## Questions Explored
- What is the overall customer churn rate?
- How does churn rate vary by age group?
- How does churn rate vary by country?
- Is there a relationship between filing a complaint and churning?
- How does the number of products a customer holds affect churn rate?

## Key Findings
- Customers who filed a complaint churned at a rate of nearly 100%, 
  compared to less than 1% for customers with no complaints
- Customers aged 46-60 had the highest churn rate at 51.12%
- Customers holding 3 products churned at a rate of 82.71%, the highest 
  among all product counts
- Germany had a notably higher churn rate (32.44%) compared to France 
  and Spain (around 16% each)
