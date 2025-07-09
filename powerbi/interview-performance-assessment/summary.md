# 🧑‍🏫 Interview Performance Assessment Report

## 📌 Overview
The **Interview Performance Assessment Dashboard** is a data-driven Power BI tool designed to evaluate interview effectiveness, preparation quality, and mentor impact across technical and non-technical interviews. It visualizes key performance indicators (KPIs) for students, mentors, and recruiters to uncover best practices and areas needing improvement.

---

##  Key KPIs & Metrics
- **Total Interviews Conducted**
- **Mentor Preparation Percentage (MentorPrep%)**
- **Prep Score (%)**
- **Interview Score (%)**
- **Recruiter/Tech Interview Ratio**
- **Interview Score Not Scored %**
- **Week-over-Week (WoW%) Changes**
- **Performance by Mentor & Applicant**

---

## 💡 Insights Generated

###  Positive Insight (Week: 05/13/24–05/19/24)
- **Preparation Score** improved by **40%** WoW.
- **Interview Score** rose by **20%** WoW, suggesting higher engagement and better alignment in interview execution.

###  Negative Insight (Week: 06/10/24–06/16/24)
- Both **Prep Score** and **Interview Score** declined by **20%** and **49%** WoW respectively.
- No improvement was observed, signaling a need for targeted follow-up and mentoring.

###  Additional Insights
- **Mentor impact** varies widely. Top performers show high MentorPrep% and strong candidate outcomes.
- Candidates with **Recruit/Tech Interview Ratios** near or below 1.0 tend to perform better.
- **Interview Score Not Scored %** above 30% suggests gaps in post-interview evaluations.
- **Word cloud** visual reveals top job titles like "Developer", "Data", and "Analyst" are most frequently associated with interviews, useful for aligning prep with roles.

---

## 📁 Data Sources
- `Interview_Dataset`: Contains detailed records of interview sessions, mentor involvement, feedback scores, and applicant performance.
- `Calendar`: A custom time intelligence table to support weekly, monthly, and cumulative insights.

---

## ⚙️ Tools & Techniques
- **Power BI Desktop** for dashboard creation and interactive visuals.
- **DAX Measures** for:
  - WoW % change in key metrics
  - Prep Score and Interview Score calculations
  - MentorPrep% aggregation
  - Rec/Tech Ratio and interview scoring breakdowns
- **Conditional Formatting** for highlighting score trends using red/green indicators
- **Scatter plot & Word cloud visuals** for role-based and applicant-based insights

---

## 📄 Additional Files
- [`dax-formulas.md`](dax-formulas.md): All DAX measures powering the dashboard  
- [`sql-formulas.sql`](sql-formulas.sql): SQL logic for transforming raw interview data into analytic-ready format

---

## 🔖 License
This project is for educational and analytical demonstration purposes only.

