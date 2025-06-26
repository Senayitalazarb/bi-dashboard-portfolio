# Emergency Room Visit Report

## 🏥 Overview
The **Emergency Room Visit Report** is a comprehensive Power BI dashboard built to monitor and analyze key operational metrics in an emergency care setting. It tracks total patient visits, average wait times, satisfaction scores, referral rates, and weekly performance trends — helping hospitals and healthcare teams identify inefficiencies and enhance patient experience.

---

## 📊 Key KPIs & Metrics
- **Total Visits**
- **Satisfaction Rate (%)**
- **Average Wait Time (mins)**
- **Referred Patient Percentage**
- **Week-over-Week (WoW%) Variance**
- **Satisfaction Score by Age Group and Wait Time Group**

---

## 📈 Insights Generated
- Patient satisfaction tends to drop sharply when wait times exceed **30 minutes**.
- **Monday** is consistently the busiest day, with the highest volume of visits.
- **Elderly patients (70+)** report the lowest satisfaction scores.
- **WoW Variance visualization** provides a quick snapshot of which metrics are improving or declining.
- Darker scales in the heatmap highlight stronger satisfaction levels across age and race groups.

---

## 📁 Data Sources
- `Patient_Dataset`: Includes fields like `SatisfactionScore`, `Moments`, `department_referral`, `patient_age`, and `date`.
- `Calander`: Custom date table used for time intelligence and WoW calculations.

---

## ⚙️ Tools & Techniques
- **Power BI Desktop** for building interactive visuals and KPI cards
- **DAX Measures** for:
  - Week-over-Week % change
  - Referred patient calculations
  - Age group satisfaction logic
- **Custom Calendar Table** to support Year, Month, Week-based filtering
- **Conditional formatting** for directional arrows and WoW variance (green/red)

---

## 🎞️ Dashboard Preview

![Emergency Room Visit GIF](![Emergency Room Visit GIF](powerbi/assets/gifs/EmergencyRoomVisit.gif)
)

---

## 📄 Additional Files
- [`dax-formulas.md`](dax-formulas.md) – All DAX measures used in the dashboard  
- [`sql-formulas.sql`](sql-formulas.sql) – SQL logic for cleaning, transformation, and KPI generation
