#  Tableau Calculated Fields – Customer Analysis Dashboard

```tableau
-- Total Revenue
[Total]

-- Month (from Order Date)
DATENAME('month', [Order Date]) + " " + STR(YEAR([Order Date]))

-- Revenue by Gender
IF [Gender] = "Male" THEN [Total]
ELSEIF [Gender] = "Female" THEN [Total]
ELSE 0
END

-- Revenue by Region
IF CONTAINS([Region], "South") THEN [Total]
ELSEIF CONTAINS([Region], "Midwest") THEN [Total]
ELSEIF CONTAINS([Region], "West") THEN [Total]
ELSEIF CONTAINS([Region], "Northeast") THEN [Total]
ELSE 0
END

-- Revenue Bucket by Age
IF [Age (bin)] = "<20" THEN "Youth"
ELSEIF [Age (bin)] = "20-30" THEN "Young Adult"
ELSEIF [Age (bin)] = "30-40" THEN "Adult"
ELSEIF [Age (bin)] = "40-50" THEN "Mature"
ELSEIF [Age (bin)] = "50-60" THEN "Senior"
ELSEIF [Age (bin)] = "60-70" THEN "Elderly"
ELSE ">70"
END

-- Discount Category
IF [Discount Percent] = 0 THEN "No Discount"
ELSEIF [Discount Percent] < 10 THEN "Low Discount"
ELSEIF [Discount Percent] < 30 THEN "Medium Discount"
ELSE "High Discount"
END

-- Quantity to Discount Ratio
IF [Discount Percent] > 0 THEN [Qty Ordered] / [Discount Percent]
ELSE NULL
END

-- Region Share %
[Total] / WINDOW_SUM([Total])

