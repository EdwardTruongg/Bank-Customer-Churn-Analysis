SELECT * FROM CustomerChurnRecords

-- How many total customers are in the dataset?
SELECT DISTINCT COUNT(CustomerId) FROM CustomerChurnRecords

--How many customers churned vs stayed?
SELECT COUNT(CASE WHEN Exited = 1 THEN 1 END) AS ChurnedCustomers, 
		COUNT(CASE WHEN Exited = 0 THEN 1 END) AS StayedCustomers 
FROM CustomerChurnRecords

--What is the churn rate as a percentage of total customers?
SELECT COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / COUNT(CustomerId) AS ChurnRatePercentage 
FROM CustomerChurnRecords

--How many customers are from each country?
SELECT COUNT(customerId) AS NumberOfCustomers,Geography 
FROM CustomerChurnRecords
GROUP BY Geography

--How many male vs female customers are there?
SELECT SUM(CASE WHEN Gender = 'Male' THEN 1 ELSE 0 END) AS MaleCustomers, SUM(CASE WHEN Gender = 'Female' THEN 1 ELSE 0 END) AS	FemaleCustomers FROM CustomerChurnRecords

--What is the average credit score of customers who churned vs customers who stayed?
SELECT AVG(CASE WHEN Exited = 1 THEN CreditScore END) AS AverageCreditScoreChurned, 
		AVG(CASE WHEN Exited = 0 THEN CreditScore END) AS AverageCreditScoreCustomer 
FROM CustomerChurnRecords

--What is the average account balance of churned vs non-churned customers?
SELECT AVG(CASE WHEN Exited = 1 THEN Balance END) AS AverageChurnedBalance, 
		AVG(CASE WHEN Exited = 0 THEN Balance END) AS AverageCustomerBalance 
FROM CustomerChurnRecords

--Which age group has the highest churn rate — break age into groups (under 30, 30-45, 46-60, over 60)
SELECT COUNT(CASE WHEN Exited = 1 AND Age < 30 THEN 1 END) * 100.0 / COUNT(CASE WHEN Age < 30 THEN 1 END) AS ChurnRateUnder30,
		COUNT(CASE WHEN Exited = 1 AND Age BETWEEN 30 AND 45 THEN 1 END) * 100.0 / COUNT(CASE WHEN Age BETWEEN 30 AND 45 THEN 1 END) AS ChurnRate30to45,
		COUNT(CASE WHEN Exited = 1 AND Age BETWEEN 46 AND 60 THEN 1 END) * 100.0 / COUNT(CASE WHEN Age BETWEEN 46 AND 60 THEN 1 END) AS ChurnRate46to60,
		COUNT(CASE WHEN Exited = 1 AND Age > 60 THEN 1 END) * 100.0 / COUNT(CASE WHEN Age > 60 THEN 1 END) AS ChurnRateOver60
FROM CustomerChurnRecords

--What is the churn rate by number of products a customer holds?
SELECT COUNT(CASE WHEN NumOfProducts = 1 AND Exited = 1 THEN 1 END) * 100.0 / COUNT(CASE WHEN NumOfProducts = 1 THEN 1 END) AS ChurnRateOneProduct,
		COUNT(CASE WHEN NumOfProducts = 2 AND Exited = 1 THEN 1 END) * 100.0 / COUNT(CASE WHEN NumOfProducts = 2 THEN 1 END) AS ChurnRateTwoProducts,
		COUNT(CASE WHEN NumOfProducts = 3 AND Exited = 1 THEN 1 END) * 100.0 / COUNT(CASE WHEN NumOfProducts = 3 THEN 1 END) AS ChurnRateThreeProducts
FROM CustomerChurnRecords

--What is the average satisfaction score of customers who churned vs stayed?
SELECT AVG(CASE WHEN Exited = 1 THEN CAST(Satisfaction_score AS FLOAT) END) AS AverageChurnedSatisfactionScore,
		AVG(CASE WHEN Exited = 0 THEN CAST(Satisfaction_score AS FLOAT) END) AS AverageCustomerSatisfactionScore
FROM CustomerChurnRecords

--What is the churn rate by country?
SELECT Geography,COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / Count(CustomerId) AS ChurnRate
FROM CustomerChurnRecords
GROUP BY Geography

--Do customers who made a complaint churn more than those who did not?
SELECT COUNT(CASE WHEN Complain = 1 AND Exited = 1 THEN 1 END) * 100.0 / COUNT(CASE WHEN Complain = 1 THEN 1 END) AS ChurnRateComplained,
		COUNT(CASE WHEN Complain = 0 AND Exited = 1 THEN 1 END) * 100.0 / COUNT(CASE WHEN Complain = 0 THEN 1 END) AS ChurnRateNoComplaint
FROM CustomerChurnRecords

--What is the churn rate by card type (Diamond, Gold, Silver, Platinum)?
SELECT Card_Type, 
		COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / COUNT(CustomerId) AS ChurnRate
FROM CustomerChurnRecords
GROUP BY Card_Type

--Among churned customers, what percentage were active members vs inactive members?
SELECT COUNT(CASE WHEN IsActiveMember = 1 AND Exited = 1 THEN 1 END) * 100.0 / COUNT(CASE WHEN IsActiveMember = 1 THEN 1 END) AS ChurnRateActive,
		COUNT(CASE WHEN IsActiveMember = 0 AND Exited = 1 THEN 1 END) * 100.0 / COUNT(CASE WHEN IsActiveMember = 0 THEN 1 END) AS ChurnRateInactive
FROM CustomerChurnRecords

--What is the average balance and credit score grouped by both country and whether they churned?
SELECT Geography, Exited, AVG(Balance) AS AverageBalance, AVG(CreditSCore) AS AverageCreditScore
FROM CustomerChurnRecords
GROUP BY Geography, Exited
