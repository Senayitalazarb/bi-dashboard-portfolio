#  Sales Marketing Dashboard

## 📌 Overview
The **Sales Marketing Dashboard** is an interactive Power BI report that provides a comprehensive view of company performance across revenue, cost, profit, lead sources, marketing campaigns, and country-specific trends. It is designed to help executives, analysts, and marketing teams monitor key performance metrics and make data-driven decisions.

---

##  Key KPIs & Metrics

- **Revenue:** $40M (+5.9% MoM)
- **Cost:** $31M (+6.4% MoM)
- **Profit:** $8.7M (+4.3% MoM)
- **Average Conversion Rate:** 17.24% (-1.1% MoM)
- **Views:** 3M (+1.9% MoM)

---

##  Visuals & Insights

###  Revenue by Month
A line chart comparing actual revenue vs. planned revenue (PM) across the calendar year. April and October are peak months, while July shows a dip in revenue.

###  Revenue by Lead Source
Top-performing lead sources include:
- **Email (22.97%)**
- **Referral (21.48%)**
- **Social Media (19.22%)**
- **Cold Calling (18.52%)**
- **Website (17.81%)**

###  Revenue by Sales Channel
- **Online Sales:** $27M (67.01%)
- **In-Store Sales:** $13M (32.9%)

###  Revenue by Marketing Campaign
- **Top campaign:** Spring Promo 2024 – $8.9M
- Other strong performers: Summer Deals 2024, New Year Campaign

###  Revenue by Region
- **Asia & Europe:** Top contributors, each generating $11M
- **North America:** $10M
- **South America:** $8M

###  Revenue & Session by Country
- **Top Countries by Revenue:** United States ($6M), Japan ($6M)
- Countries with high sessions but moderate revenue include Canada, South Korea, and Brazil.

---

## 📁 Data Sources

- `sales_data.csv`: Includes columns such as `Date`, `Region`, `Campaign`, `LeadSource`, `SalesChannel`, `Revenue`, `Cost`, `Sessions`, and `Country`.

---

## ⚙️ Tools & Techniques

- **Power BI Desktop** for dashboard design and interaction
- **DAX** for dynamic calculations like profit, conversion rate, and month-over-month changes
- **Custom Date Table** for time intelligence (monthly/yearly slicing)
- **Drillthrough & Tooltips** for exploring product-level details
- **Map visuals and slicers** to explore country-specific sessions and revenue

---

## 📄 Additional Files
- [`dax-formulas.md`](dax-formulas.md): All DAX measures used for KPIs and analysis  
- [`sql-formulas.sql`](sql-formulas.sql): SQL queries used to prepare and transform the dataset

---

## 🔖 License
This project is for demo and educational purposes only. All data is anonymized.

