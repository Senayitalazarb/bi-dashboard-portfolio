#  Tableau Calculated Fields – HR Analytics Dashboard

```tableau
-- Attrition Count
IF [Attrition] = "Yes" THEN 1 ELSE 0 END

-- Active Employee
IF [Attrition] = "No" THEN 1 ELSE 0 END

-- Attrition Rate (%)
SUM([Attrition Count]) / SUM([Employee Count])

-- Average Employee Age
AVG([Age])

-- Age Banding
IF [Age] < 25 THEN "Under 25"
ELSEIF [Age] <= 34 THEN "25 - 34"
ELSEIF [Age] <= 44 THEN "35 - 44"
ELSEIF [Age] <= 54 THEN "45 - 54"
ELSE "Over 55"
END

-- Gender-wise Attrition Flag
IF [Attrition] = "Yes" AND [Gender] = "Male" THEN 1
ELSEIF [Attrition] = "Yes" AND [Gender] = "Female" THEN 1
ELSE 0
END

-- Total Employees
COUNTD([Employee Number])
