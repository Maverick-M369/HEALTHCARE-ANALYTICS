# Hospital Readmission & Resource Utilization Analytics

## Overview
This project analyzes 1,000+ hospital admission records to uncover operational inefficiencies related to patient readmissions, bed utilization, and length of stay. The goal is to give hospital operations teams a clear, data-backed view of where patient flow breaks down — and which departments need attention first.

## Objectives
- Measure the overall 30-day readmission rate and identify which departments drive it
- Evaluate bed occupancy and average length of stay (LOS) as indicators of capacity strain
- Calculate discharge efficiency to flag turnover bottlenecks
- Translate findings into concrete, actionable recommendations for hospital administrators

## Dataset
- 1,000+ hospital admission records
- Fields include: patient demographics, department, admission/discharge dates, length of stay, readmission flag, bed status

## Tools Used
- **Google Sheets** — initial data inspection and cleaning
- **SQL (PostgreSQL)** — querying, aggregation, KPI calculation
- **Python (Pandas, NumPy)** — exploratory data analysis
- **Power BI (DAX)** — dashboard development and visualization

## Workflow
1. **Data Cleaning** — handled missing values, standardized department names and date formats, removed duplicate admission records
2. **Exploratory Data Analysis** — examined distributions of length of stay, readmission rates by department, and occupancy trends over time
3. **KPI Design** — built SQL queries to calculate readmission rate, average LOS, bed occupancy, and discharge efficiency
4. **Dashboard Development** — built an interactive Power BI dashboard to let stakeholders filter by department and time period

## Key Metrics & Insights
| Metric | Value | Insight |
|---|---|---|
| Overall readmission rate | **28%** | Above typical benchmark range, signals systemic follow-up gaps |
| Highest-risk department | **Neurology — 33%** | Disproportionately drives the overall readmission rate |
| Average length of stay | **8 days** | Contributes directly to sustained bed pressure |
| Bed occupancy | **81%** | Persistently high, limited slack for demand spikes |
| Discharge efficiency | **48.25%** | Under half of eligible patients discharged on time — a turnover bottleneck |

## Business Recommendations
- Prioritize a readmission-reduction program in **Neurology** first — it has the highest leverage for reducing the overall rate
- Investigate discharge-process delays — a 48.25% discharge efficiency suggests administrative or scheduling friction, not just clinical necessity
- Model bed occupancy against seasonal admission trends to plan capacity ahead of demand, rather than reactively

## Dashboard Preview
*(Add a screenshot or GIF of your Power BI dashboard here — drag an image directly into this file on GitHub's web editor and it will host it automatically.)*

## Author
**Muddassir Mulla**
[LinkedIn](https://linkedin.com/in/muddassir-mulla-b7928211a) · [GitHub](https://github.com/Maverick-M369)
