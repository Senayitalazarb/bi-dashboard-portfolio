#  SQL Queries – Customer Analysis Dashboard

-- Total Revenue
SELECT SUM(Total) AS Total_Revenue
FROM sales_06_FY2020_21;

-- Month-wise Revenue
SELECT 
  TO_CHAR("Order Date", 'Mon YYYY') AS Month_Year,
  SUM(Total) AS Monthly_Revenue
FROM sales_06_FY2020_21
GROUP BY Month_Year
ORDER BY TO_DATE(Month_Year, 'Mon YYYY');

-- Revenue by State
SELECT 
  State,
  SUM(Total) AS State_Revenue
FROM sales_06_FY2020_21
GROUP BY State
ORDER BY State_Revenue DESC;

-- Revenue by Age Group
SELECT 
  "Age (bin)" AS Age_Group,
  SUM(Total) AS Revenue
FROM sales_06_FY2020_21
GROUP BY "Age (bin)"
ORDER BY Revenue DESC;

-- Revenue by Region
SELECT 
  Region,
  SUM(Total) AS Region_Revenue,
  ROUND(SUM(Total) * 100.0 / SUM(SUM(Total)) OVER (), 2) AS Region_Share_Percent
FROM sales_06_FY2020_21
GROUP BY Region
ORDER BY Region_Revenue DESC;

-- Quantity vs. Discount Correlation
SELECT 
  "Discount Percent",
  SUM("Qty Ordered") AS Total_Quantity
FROM sales_06_FY2020_21
GROUP BY "Discount Percent"
ORDER BY "Discount Percent";

-- Gender-wise Revenue
SELECT 
  Gender,
  SUM(Total) AS Revenue
FROM sales_06_FY2020_21
GROUP BY Gender;

-- Gender-wise Revenue by Category
SELECT 
  Gender,
  Category,
  SUM(Total) AS Revenue
FROM sales_06_FY2020_21
GROUP BY Gender, Category
ORDER BY Category, Revenue DESC;

-- Discount Buckets
SELECT 
  CASE 
    WHEN "Discount Percent" = 0 THEN 'No Discount'
    WHEN "Discount Percent" < 10 THEN 'Low Discount'
    WHEN "Discount Percent" < 30 THEN 'Medium Discount'
    ELSE 'High Discount'
  END AS Discount_Category,
  COUNT(*) AS Transactions,
  SUM(Total) AS Revenue
FROM sales_06_FY2020_21
GROUP BY Discount_Category;

