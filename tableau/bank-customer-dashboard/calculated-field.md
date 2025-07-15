#  Tableau Calculated Fields – UK Bank Customer Segmentation Dashboard

```tableau
-- Age Group
IF [Age] < 20 THEN "<20"
ELSEIF [Age] <= 30 THEN "20-30"
ELSEIF [Age] <= 40 THEN "30-40"
ELSEIF [Age] <= 50 THEN "40-50"
ELSE ">50"
END

-- Balance Group
IF [Balance] < 36000 THEN "0 - 36K"
ELSEIF [Balance] <= 72000 THEN "36K - 72K"
ELSE "72K+"
END

-- Total Customers
COUNTD([Customer ID])
