# 🏥 Emergency Room Visit Report

## 📌 Overview
The **Emergency Room Visit Report** is a dynamic Power BI dashboard designed to monitor and improve patient experience and operational efficiency in emergency care. It tracks key metrics such as total visits, wait times, satisfaction rates, referral trends, and demographic-based performance insights. The report enables healthcare teams to quickly identify issues, uncover patterns, and take action.

---

## 📊 Key KPIs & Metrics
- **Total Visits**
- **Satisfaction Rate (%)**
- **Average Wait Time (mins)**
- **Referred Patient Percentage**
- **Week-over-Week (WoW%) Variance**
- **Satisfaction Score by Age Group and Wait Time Group**

---

## 💡 Insights Generated

### ✅ Positive Insights
- Reducing wait times—especially under **35 minutes**—boosts satisfaction, increasing average ratings to **60%**, with some groups reaching **75%**.
- **Asian patients** showed an **8% drop** in wait times (to 32.84 minutes), resulting in a satisfaction score of **75%**.
- **Patients aged 51–60** benefited from cultural competence and proactive management, leading to faster diagnoses and higher trust.
- Targeted improvements for **older patients (70+)**, currently at **51%** satisfaction, can raise scores by **10%**, significantly enhancing care quality.

### ⚠️ Negative Insights
- Patients waiting over **55 minutes** report sharply lower satisfaction (**58%**) and an average score of **2.46**.
- **Elderly patients (70+)** have the **lowest satisfaction** and a score of **3.63**, indicating delays, communication gaps, or unmet care needs.
- Satisfaction significantly drops when wait time exceeds **30 minutes**, especially for non-referred patients or walk-ins.

---

## 📁 Data Sources
- `Patient_Dataset`: Includes patient demographics, wait times, satisfaction scores, and referral information.
- `Calendar`: Custom date table supporting Year-Month-Week filters and WoW calculations.

---

## ⚙️ Tools & Techniques
- **Power BI Desktop** for dashboard development and visualization
- **DAX Measures** for:
  - Week-over-Week % changes
  - Referred patient KPIs
  - Grouped satisfaction analysis by age and wait time
- **Custom Calendar Table** for flexible date filtering
- **Conditional Formatting** for WoW arrows (green/red) and satisfaction bands

---

## 🖼️ Dashboard Preview

![Emergency Room Visit GIF](powerbi/assets/gifs/EmergencyRoomVisit.gif)

---

## 📄 Additional Files
- [`dax-formulas.md`](dax-formulas.md): DAX measures used in the dashboard  
- [`sql-formulas.sql`](sql-formulas.sql): SQL queries for cleaning, transforming, and generating KPIs

---

## 🔖 License
This project is for educational and professional portfolio use only.

