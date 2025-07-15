
---
###  **`sql-formulas.sql` — SQL Queries for HR Analytics**
  
----------------------------------------------------
-- Core KPIs
----------------------------------------------------

-- 1. Total Employees
SELECT COUNT(DISTINCT EmployeeNumber) AS TotalEmployees
FROM HR_data;

-- 2. Attrition Count
SELECT COUNT(*) AS AttritionCount
FROM HR_data
WHERE Attrition = 'Yes';

-- 3. Active Employees
SELECT COUNT(*) AS ActiveEmployees
FROM HR_data
WHERE Attrition = 'No';

-- 4. Attrition Rate (%)
SELECT 
  COUNT(*) FILTER (WHERE Attrition = 'Yes') * 1.0 / COUNT(*) AS AttritionRate
FROM HR_data;

-- 5. Average Age
SELECT AVG(Age) AS AverageAge
FROM HR_data;

----------------------------------------------------
-- Analysis Queries
----------------------------------------------------

-- 6. Attrition by Department
SELECT 
  Department, 
  COUNT(*) AS TotalEmployees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS AttritionRate
FROM HR_data
GROUP BY Department;

-- 7. Attrition by Age Group
SELECT 
  CASE
    WHEN Age < 25 THEN 'Under 25'
    WHEN Age BETWEEN 25 AND 34 THEN '25 - 34'
    WHEN Age BETWEEN 35 AND 44 THEN '35 - 44'
    WHEN Age BETWEEN 45 AND 54 THEN '45 - 54'
    ELSE 'Over 55'
  END AS AgeGroup,
  COUNT(*) AS TotalEmployees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS AttritionRate
FROM HR_data
GROUP BY AgeGroup;

-- 8. Attrition by Education Field
SELECT 
  [EducationField], 
  COUNT(*) AS TotalEmployees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS AttritionRate
FROM HR_data
GROUP BY [EducationField];

-- 9. Job Satisfaction Distribution by Role
SELECT 
  [JobRole], 
  [JobSatisfaction], 
  COUNT(*) AS EmployeeCount
FROM HR_data
GROUP BY [JobRole], [JobSatisfaction]
ORDER BY [JobRole], [JobSatisfaction];

