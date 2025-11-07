# Bank Loan Analytics – Power BI Project

This project analyses bank loan data to evaluate the performance of lending operations and provide portfolio insights. The problem statement defines several KPIs such as Total Loan Applications, Funded Amount, Received Amount, Interest Rate, and DTI. SQL is used to extract the required fields from the source dataset, and Power BI is used to model, transform, and visualise the metrics into dashboards.

## Files Included

| File Name | Purpose |
|----------|---------|
| **Problem Statement.docx** | Original business requirements & dashboard KPIs |
| **loan.sql** | SQL queries used to fetch & calculate required metrics |
| **financial_loan.xlsx** | Source dataset used for analysis |
| **loan_project.pbix** | Power BI file containing the dashboards |

## Dashboards in Power BI

The `.pbix` file contains **3 dashboards**:

| Dashboard | Description |
|----------|-------------|
| **Summary** | Overall KPIs + Good Loan vs Bad Loan metrics |
| **Overview** | Trend charts (Monthly), State map, Term analysis, Purpose analysis |
| **Details** | Full detailed record-level view of all loans with filters |

## How to View the Dashboards

1. Download or clone this repository
2. Make sure Power BI Desktop is installed  
   (Free download: https://powerbi.microsoft.com/desktop/)
3. Open **loan_project.pbix** in Power BI Desktop
4. Explore each dashboard using slicers & filters

## Tech Stack

- SQL (for data extraction & transformation logic)
- Microsoft Power BI (DAX modelling + interactive visual dashboards)
- Excel

## Objective of the Project

To track loan portfolio performance, identify trends, evaluate borrower quality, and support data-driven lending decisions.
