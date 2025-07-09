#  Sales Marketing Dashboard - DAX Formulas

This document includes all DAX measures used in the Sales Marketing Dashboard. These are based on a fact table named `Sales_Data` and assume a related `Date` table for time intelligence.

---

## 📌 Core KPI Measures

```dax
-- Revenue (Total)
Revenue = SUM(Sales_Data[Revenue])

-- Cost (Total)
Cost = SUM(Sales_Data[Cost])

-- Profit
Profit = [Revenue] - [Cost]

-- Views
Total Views = SUM(Sales_Data[Views])

-- Average Conversion Rate
Avg Conversion Rate = AVERAGE(Sales_Data[ConversionRate])

-- Revenue MoM % Change
Revenue MoM % = 
VAR Current = [Revenue]
VAR Previous = 
    CALCULATE([Revenue], 
        DATEADD('Date'[Date], -1, MONTH)
    )
RETURN DIVIDE(Current - Previous, Previous)

-- Cost MoM % Change
Cost MoM % = 
VAR Current = [Cost]
VAR Previous = 
    CALCULATE([Cost], 
        DATEADD('Date'[Date], -1, MONTH)
    )
RETURN DIVIDE(Current - Previous, Previous)

-- Profit MoM % Change
Profit MoM % = 
VAR Current = [Profit]
VAR Previous = 
    CALCULATE([Profit], 
        DATEADD('Date'[Date], -1, MONTH)
    )
RETURN DIVIDE(Current - Previous, Previous)

-- Conversion Rate MoM % Change
Conversion Rate MoM % = 
VAR Current = [Avg Conversion Rate]
VAR Previous = 
    CALCULATE([Avg Conversion Rate], 
        DATEADD('Date'[Date], -1, MONTH)
    )
RETURN DIVIDE(Current - Previous, Previous)

-- Views MoM % Change
Views MoM % = 
VAR Current = [Total Views]
VAR Previous = 
    CALCULATE([Total Views], 
        DATEADD('Date'[Date], -1, MONTH)
    )
RETURN DIVIDE(Current - Previous, Previous)

-- Revenue by Lead Source
Revenue by Lead Source = SUM(Sales_Data[Revenue])

-- Revenue by Campaign
Revenue by Campaign = SUM(Sales_Data[Revenue])

-- Revenue by Sales Channel
Revenue by Channel = SUM(Sales_Data[Revenue])

-- Revenue by Region
Revenue by Region = SUM(Sales_Data[Revenue])

-- Sessions by Country
Sessions = SUM(Sales_Data[Sessions])

-- Revenue by Country
Revenue by Country = SUM(Sales_Data[Revenue])

-- Conversion Rate by Channel (Optional)
Conversion Rate by Channel = AVERAGE(Sales_Data[ConversionRate])


