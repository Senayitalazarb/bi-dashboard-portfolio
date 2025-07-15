-- 📁 Tableau Calculated Fields for HR Analytics Dashboard

----------------------------------------------------
-- 1️⃣ Attrition Count : Marks employees who have left the organization
----------------------------------------------------
IF [Attrition] = "Yes" THEN 1 ELSE 0 END

----------------------------------------------------
-- 2️⃣ Active Employee: Identifies current employees
----------------------------------------------------
IF [Attrition] = "No" THEN 1 ELSE 0 END

----------------------------------------------------
-- 3️⃣ Attrition Rate (%): Calculates total attrition rate as a percentage
----------------------------------------------------
SUM([Attrition Count]) / SUM([Employee Count])

----------------------------------------------------
-- 4️⃣ Average Employee Age: Calculates average employee age
----------------------------------------------------
AVG([Age])

----------------------------------------------------
-- 5️⃣ Age Banding (for Grouping): Categorizes employees into age bands
----------------------------------------------------
IF [Age] < 25 THEN "Under 25"
ELSEIF [Age] <= 34 THEN "25 - 34"
ELSEIF [Age] <= 44 THEN "35 - 44"
ELSEIF [Age] <= 54 THEN "45 - 54"
ELSE "Over 55"
END

----------------------------------------------------
-- 6️⃣ Gender-wise Attrition Flag: Flags attrition events by gender for visual split
----------------------------------------------------
IF [Attrition] = "Yes" AND [Gender] = "Male" THEN 1
ELSEIF [Attrition] = "Yes" AND [Gender] = "Female" THEN 1
ELSE 0
END

----------------------------------------------------
-- 7️⃣ Total Employees: Calculates distinct employee count
----------------------------------------------------
COUNTD([Employee Number])

