-- 📁 SQL Queries for UK Bank Customer Segmentation Dashboard

-- 1️⃣ Total Customers
SELECT COUNT(DISTINCT [Customer ID]) AS Total_Customers
FROM UK_Bank_Customers;

-- 2️⃣ Customers by Region
SELECT 
  Region, 
  COUNT(*) AS Customer_Count
FROM UK_Bank_Customers
GROUP BY Region
ORDER BY Customer_Count DESC;

-- 3️⃣ Customers by Age Group
SELECT 
  CASE
    WHEN Age < 20 THEN '<20'
    WHEN Age BETWEEN 20 AND 30 THEN '20-30'
    WHEN Age BETWEEN 31 AND 40 THEN '30-40'
    WHEN Age BETWEEN 41 AND 50 THEN '40-50'
    ELSE '>50'
  END AS Age_Group,
  COUNT(*) AS Customer_Count
FROM UK_Bank_Customers
GROUP BY Age_Group
ORDER BY Customer_Count DESC;

-- 4️⃣ Customers by Balance Group
SELECT 
  CASE
    WHEN Balance < 36000 THEN '0 - 36K'
    WHEN Balance BETWEEN 36000 AND 72000 THEN '36K - 72K'
    ELSE '72K+'
  END AS Balance_Group,
  COUNT(*) AS Customer_Count
FROM UK_Bank_Customers
GROUP BY Balance_Group
ORDER BY Customer_Count DESC;

-- 5️⃣ Customers by Job Classification
SELECT 
  [Job Classification], 
  COUNT(*) AS Customer_Count
FROM UK_Bank_Customers
GROUP BY [Job Classification]
ORDER BY Customer_Count DESC;

-- 6️⃣ Customers by Gender
SELECT 
  Gender, 
  COUNT(*) AS Customer_Count
FROM UK_Bank_Customers
GROUP BY Gender
ORDER BY Customer_Count DESC;
