#  Netflix Global Content Dashboard (Tableau)

## 📌 Overview
This Tableau dashboard analyzes Netflix’s global catalog, focusing on the distribution of movies and TV shows by country, genre, release year, rating, and type. It offers a snapshot of content diversity and allows exploration of trends and availability across regions.

---

##  Objective
To provide insights into the global availability and genre distribution of Netflix content, helping understand where different types of shows are popular, what genres dominate, and how Netflix's catalog has evolved over time.

---

##  Key KPIs & Visuals

- **Content Type Distribution:** Pie chart showing % split between Movies (68.4%) and TV Shows (31.6%)
- **Total Shows by Country:** World map heatmap showing content count per country
- **Top 10 Genres:** Bar chart ranking genres like Documentaries, Comedy, and Dramas
- **Ratings Distribution:** Shows distribution by maturity ratings (e.g., TV-MA, PG, R)
- **Content Growth Over Time:** Area chart visualizing content release growth by type since 2008
- **Show Metadata Panel:** Interactivity to explore detailed title info (genre, year, duration, description)

---

##  Filters / Interactions

- **Title Selector**: Explore metadata (genre, rating, description) of specific titles
- **Type Filter**: Toggle between Movie and TV Show
- **Map Interactivity**: Hover or select countries to view content counts
- **Genre & Rating Drilldown**: Identify content concentration by category

---

## 📁 Data Source

- Dataset: `Netflix Titles`  
  Columns include: `Title`, `Type`, `Country`, `Genre`, `Rating`, `Duration`, `Date Added`, `Release Year`, `Description`

---

## 🛠️ Tools & Techniques

- **Tableau Desktop** for interactive dashboards
- **Mapbox Integration** for global content map
- **Bar, Pie, Area Charts** for content breakdown
- **Parameter & Filters** to drive dynamic exploration
- **Calculated Fields** to categorize, aggregate, and segment content

---

## 📄 Additional Files

- [`calculated_fields.md`](calculated_fields.md) – List of all custom calculations

---

## 🔖 License

This project is for educational and portfolio demonstration purposes only. All data is publicly sourced from the Netflix dataset.

