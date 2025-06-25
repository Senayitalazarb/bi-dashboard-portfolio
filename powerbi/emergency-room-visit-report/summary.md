# Emergency Room Visit Report

## 🏥 Overview
The **Emergency Room Visit Report** is an interactive Power BI dashboard designed to monitor and analyze patient visits, wait times, and satisfaction trends within an emergency care setting. This report is critical for identifying service bottlenecks, improving patient experience, and supporting operational decision-making.

---

## 📊 Key KPIs & Metrics
- **Total Visits**
- **Average Wait Time**
- **Avg. Satisfaction Score**
- **Visit Week-over-Week (WoW%) Change**
- **Wait Time Variance by Day/Hour**
- **Top Reasons for ER Visits**

---

## 📈 Insights Generated
- ER visits peak on **Mondays** and during **evening hours**
- **Average wait time** exceeded benchmarks during Week 36 and Week 37
- A **negative correlation** was observed between wait time and satisfaction score
- The **WoW trend analysis** indicated a 12% increase in visits following local flu outbreak

---

## 📁 Data Sources
- Simulated or anonymized patient visit records (CSV)
- Fields include: `Visit Date`, `Patient ID`, `Wait Time`, `Satisfaction Score`, `Visit Reason`

---

## ⚙️ Tools & Techniques
- **Power BI Desktop**
- **DAX Measures** for dynamic week-over-week calculations
- **Custom Calendar Table** with Year-Month-Week breakdown
- **Conditional Formatting** and KPIs with dynamic arrows

---

## 🖼️ Screenshot
![Emergency Room Dashboard Overview](screenshots/er_dashboard_overview.png)

---

## 📄 Additional Files
- See [`dax-formulas.md`](dax-formulas.md) for all calculated measures used in the dashboard.


