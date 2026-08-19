Markdown
# 🛒 E-Commerce Customer Analytics & Retention Engine

An end-to-end data analytics and engineering project analyzing **96K+ orders** from the Brazilian E-Commerce public dataset (Olist). This repository showcases relational SQL schema modeling, automated Python data transformation, customer RFM (Recency, Frequency, Monetary) segmentation, cohort retention analysis, and an executive Power BI dashboard.

---

## 📌 Executive Summary & Key KPIs

* **Total Revenue:** **$15.42M** generated across completed orders.
* **Order Volume:** **~96,000** total orders fulfilled.
* **Average Order Value (AOV):** **$159.83** per transaction.
* **Fulfillment Efficiency:** **92.1% On-Time Delivery Rate**.
* **Top Revenue Drivers:** High-volume sales led by `health_beauty`, `watches_gifts`, and `bed_bath_table`.
* **Retention Opportunity:** **72.96%** of buyers fall into the *One-Time Low Value* segment, indicating significant leverage for automated post-purchase email flows and loyalty campaigns.

---

## 🛠️ Tech Stack & Architecture

Data Processing Flow:
Raw CSVs ➡️ SQL Schema & Relational DB ➡️ Python ETL & RFM Engine ➡️ SQL Retention Cohorts ➡️ Power BI Dashboard


* **Database & SQL:** SQLite (`olist.db`), Data Definition Language (DDL) schemas, indexing, and multi-stage CTE queries for retention analysis.
* **Python Data Pipeline:** `pandas`, `numpy`, `sqlite3` for data cleaning, merging, and RFM metric generation.
* **Data Visualization & Analytics:** Power BI Desktop, DAX measures, star schema data modeling, and custom date hierarchies.

---

## 📁 Repository Structure

```text
olist-retention-analysis/
├── dashboards/
│   └── images/                     # Dashboard preview screenshots
├── data/
│   ├── processed/
│   │   ├── olist_cleaned_merged.csv # Transformed transactional dataset
│   │   ├── olist_rfm_summary.csv    # Calculated customer RFM scores & segments
│   │   └── olist.db                 # SQLite database file
│   └── raw/                         # Raw Kaggle source CSVs
├── notebooks/
│   └── 01_data_cleaning.ipynb       # Python ETL pipeline & exploratory data analysis
├── sql/
│   ├── 01_schema.sql                # Table DDL, foreign key relations & index creation
│   └── 02_retention_cohorts.sql     # Multi-stage CTE query for monthly cohort retention %
├── PowerBI_Dashboard.pbix           # Interactive Power BI report
└── README.md                        # Documentation
📊 Technical Highlights & Workflows
1. Relational Database & SQL Analytics (/sql)
01_schema.sql: Structured relational tables for customers, orders, and order_items with indexed foreign keys for optimized aggregation performance.

02_retention_cohorts.sql: Evaluates customer cohort survival curves over time using Common Table Expressions (CTEs) to map first purchase dates against subsequent purchase activity.

2. Python Data Engineering (/notebooks)
Merged fragmented transactional datasets into a consolidated analytical table.

Cleaned null values, corrected timestamp formats, and generated RFM scores to group customers into actionable cohorts (Loyal VIP, New/Recent, At Risk, and One-Time Low Value).

3. Business Intelligence Dashboard (PowerBI_Dashboard.pbix)
KPI Header Banner: Immediate metric tracking for revenue, volume, basket size, and fulfillment SLA.

Product Performance: Top 10 category revenue distribution mapped through an active 1:* relationship to Portuguese-to-English translation mapping.

Customer Segment Breakdown: Donut visual depicting customer lifetime value distribution.

Monthly Sales Trajectory: Expanded date hierarchy line chart tracking monthly seasonality across 2016–2018.

🚀 How to Run & Replicate
Clone the Repo:

Bash
git clone [https://github.com/your-username/olist-retention-analysis.git](https://github.com/your-username/olist-retention-analysis.git)
cd olist-retention-analysis
Build Database & Run Pipeline:

Open /sql/01_schema.sql inside SQLite to build the database schema.

Run /notebooks/01_data_cleaning.ipynb to clean data and output processed CSVs.

Open Dashboard:

Launch PowerBI_Dashboard.pbix in Power BI Desktop to explore measures and interactive cross-filtering.
