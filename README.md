# What Drives Returns in Fashion Retail?

**Ironhack Data Analytics Bootcamp | Final Project (Case Study 2: Data Analytics End to End) | October 2026**
**Author:** Ana Claudia Russo

An end-to-end analysis of product returns in fashion retail, from raw data to a final Tableau story: Python for cleaning and statistics, MySQL for relational analysis, and Tableau Public for dashboards and storytelling.

---

## Business question

> Which product characteristics are most associated with returns, and what actions could help reduce them?

**Who is this for:** fashion retail brands operating online and on other retail platforms.

---

## Dataset

- **Source:** Kaggle, *Retail Fashion Boutique* dataset
- **Size:** 2,176 purchases (synthetic data), 15 variables after cleaning (product, brand, collection, category, size, price, discount, rating, return reason and more)

> The dataset is synthetic, so findings are illustrative and should be validated with real data before acting.

---

## Project pipeline

| Step | Tool | What was done |
|---|---|---|
| 1 | Python | Data collection, cleaning and exploratory data analysis (EDA) |
| 2 | Python + MySQL | Relational schema design (purchases linked to brands, categories and collections through foreign keys) and loading of the clean data |
| 3 | SQL | Analytical queries to answer business questions |
| 4 | Python | Statistical analysis (chi-square tests) to test the SQL findings |
| 5 | Tableau Public | Final dashboards and storytelling |

---

## Repository contents

| File | Description |
|---|---|
| `Retail_Fashion_DA_Project_VF.ipynb` | Python notebook: data cleaning, EDA and chi-square hypothesis tests |
| `Retail_Fashion_Boutique_Queries_VF.sql` | SQL queries used to analyze returns in MySQL |
| `Retail_Fashion_Boutique_Diagram.mwb` | MySQL Workbench model with the database schema (purchases, brands, categories, collections) |
| `_Retail_Fashion_Boutique_Presentation_VF.twbx` | Tableau packaged workbook with the dashboards and the final story (data and images included) |
| `Recommendations_SupportingDOC .pdf` | Recommendations document with context and action plan |
| `retail_fashion_tableau.csv` | Clean dataset used in Tableau |
| `README.md` | Project overview |

> Note: the Tableau workbook was built from a local CSV file. To open it with the data connection working, keep the CSV in the same folder.

---

## Tools

- **Python:** pandas, NumPy, Matplotlib, Seaborn, SciPy (chi-square tests)
- **SQL:** MySQL / MySQL Workbench
- **Visualization:** Tableau Public
