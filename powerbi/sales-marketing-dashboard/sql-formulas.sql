--  Core KPI Queries
----------------------------------------------------

-- 1. Total Revenue
SELECT SUM(Revenue) AS Total_Revenue
FROM sales_data;

-- 2. Total Cost
SELECT SUM(Cost) AS Total_Cost
FROM sales_data;

-- 3. Profit
SELECT SUM(Revenue) - SUM(Cost) AS Profit
FROM sales_data;

-- 4. Average Conversion Rate
SELECT AVG(ConversionRate) AS Avg_Conversion_Rate
FROM sales_data;

-- 5. Total Views
SELECT SUM(Views) AS Total_Views
FROM sales_data;

----------------------------------------------------
-- 📈 Month-over-Month (MoM) Changes
----------------------------------------------------
-- Assumes date is stored in column named "Date" and uses standard ANSI SQL

-- 6. Revenue MoM Change %
WITH revenue_months AS (
  SELECT
    DATE_TRUNC('month', Date) AS Month,
    SUM(Revenue) AS MonthlyRevenue
  FROM sales_data
  GROUP BY 1
)
SELECT 
  curr.Month,
  ((curr.MonthlyRevenue - prev.MonthlyRevenue) / NULLIF(prev.MonthlyRevenue, 0)) AS Revenue_MoM_Change
FROM revenue_months curr
JOIN revenue_months prev
  ON curr.Month = prev.Month + INTERVAL '1 month';

-- 7. Cost MoM Change %
-- same pattern as Revenue

-- 8. Profit MoM Change %
-- Replace Revenue and Cost in subqueries as needed

-- 9. Conversion Rate MoM Change %
WITH conv_months AS (
  SELECT
    DATE_TRUNC('month', Date) AS Month,
    AVG(ConversionRate) AS MonthlyConvRate
  FROM sales_data
  GROUP BY 1
)
SELECT 
  curr.Month,
  ((curr.MonthlyConvRate - prev.MonthlyConvRate) / NULLIF(prev.MonthlyConvRate, 0)) AS ConvRate_MoM_Change
FROM conv_months curr
JOIN conv_months prev
  ON curr.Month = prev.Month + INTERVAL '1 month';

----------------------------------------------------
-- 🔍 Detailed Breakdown Queries
----------------------------------------------------

-- 10. Revenue by Lead Source
SELECT 
  LeadSource,
  SUM(Revenue) AS Revenue,
  COUNT(*) AS Transactions
FROM sales_data
GROUP BY LeadSource
ORDER BY Revenue DESC;

-- 11. Revenue by Marketing Campaign
SELECT 
  Campaign,
  SUM(Revenue) AS Revenue
FROM sales_data
GROUP BY Campaign
ORDER BY Revenue DESC;

-- 12. Revenue by Region
SELECT 
  Region,
  SUM(Revenue) AS Revenue
FROM sales_data
GROUP BY Region;

-- 13. Revenue by Sales Channel
SELECT 
  SalesChannel,
  SUM(Revenue) AS Revenue,
  ROUND(SUM(Revenue) * 100.0 / SUM(SUM(Revenue)) OVER (), 2) AS Percentage
FROM sales_data
GROUP BY SalesChannel;

-- 14. Revenue and Sessions by Country
SELECT 
  Country,
  SUM(Sessions) AS TotalSessions,
  SUM(Revenue) AS TotalRevenue
FROM sales_data
GROUP BY Country
ORDER BY TotalRevenue DESC;

----------------------------------------------------
-- 📌 Additional Optional Analysis
----------------------------------------------------

-- 15. Top Countries by Revenue and Conversion Rate
SELECT 
  Country,
  SUM(Revenue) AS Revenue,
  AVG(ConversionRate) AS Avg_ConvRate
FROM sales_data
GROUP BY Country
ORDER BY Revenue DESC;

-- 16. Monthly Trend for Revenue and Cost
SELECT
  DATE_TRUNC('month', Date) AS Month,
  SUM(Revenue) AS Revenue,
  SUM(Cost) AS Cost
FROM sales_data
GROUP BY 1
ORDER BY Month;


