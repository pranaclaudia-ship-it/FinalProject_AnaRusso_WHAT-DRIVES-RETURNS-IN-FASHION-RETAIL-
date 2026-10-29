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
- **Overall return rate:** **14.7%** (320 returned items out of 2,176 purchases)

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

## Key findings

**Return rate by variable (highlights)**

| Variable | Highest | Lowest |
|---|---|---|
| Brand | Ann Taylor (19.8%) | Mango (11.3%) |
| Collection | Summer (17.4%) | Fall (11.9%) |
| Size | L (17.6%) | M and XXL (13.3%) |
| Category | Outerwear (16.2%) | Tops (12.8%) |
| Price range | 200+ EUR (17.6%, only 68 purchases) | 100-200 EUR (13.2%) |
| Discount range | 26-50% (17.0%) | 1-10% (10.9%) |

**Top return reasons** (share of the 320 returned items): Changed Mind (21.3%), Size Issue (18.8%), Quality Issue (17.2%), Wrong Item (14.7%), Color Mismatch (14.4%), Damaged (13.8%). Percentages are rounded.

**Hypothesis testing** (chi-square test of independence, significance level alpha = 0.05)

| # | Variable | p-value | Decision | Interpretation |
|---|---|---|---|---|
| H1 | Size | 0.642 | Fail to reject H0 | No evidence of association with returns |
| H2 | Price range | 0.741 | Fail to reject H0 | No evidence of association with returns |
| H3 | Collection | 0.049 | Reject H0 (borderline) | Return rate differs between collections (weak evidence) |

**Overall conclusion:** no single product characteristic strongly drives returns. Collection is the only (weak) signal, and the main return reasons (changed mind, size, quality) point to better product information and more conscious purchasing as the first actions to test.

---

## Recommendations

1. **Improve size charts and product information:** detailed, easy-to-follow size charts and product sheets, since "Size Issue" and "Color Mismatch" together account for about one in three returns.
2. **Reward conscious purchases in loyalty programs:** make clear that returned items reduce the points balance, to discourage impulse purchases (pilot before a full rollout).
3. **Limit free assisted returns:** offer them only above a minimum order value or to premium customers, to reduce cost and environmental impact.

---

## Limitations and next steps

- The dataset is synthetic and has no customer ID, country or return cost.
- Tests were run one variable at a time; with several tests, a borderline p-value (0.049) should be read as a lead to investigate, not a firm finding.
- **Next steps:** collect richer, real data (customer ID, country, return cost); focus on a specific brand and country (e.g. Mango in Portugal) with customer-level analysis and multi-variable models; pilot the recommendations on a small group and track return rate and cost per return.

---

## Repository contents

| File | Description |
|---|---|
| `Retail_Fashion_Boutique_Presentation_VF.twb` | Tableau workbook with the dashboards and the final story |
| `README.md` | Project overview |

Tableau Public: *add the link to the published story here*

> Note: the Tableau workbook was built from a local CSV file. To open it with the data connection working, keep the CSV in the same folder or use the Tableau Public version.

---

## Tools

Python (pandas, SciPy), MySQL / MySQL Workbench, Tableau Public.
