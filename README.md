# E-Commerce SQL Analytics Project

## Objective

This project analyzes e-commerce transactional data using SQL to extract meaningful business insights.
The focus is on revenue trends, customer behavior, product performance, and customer retention.

abhaysinghmynameisa
---

## Dataset Overview

The dataset simulates a typical e-commerce system with the following tables:

- **customers**: customer information and signup date
- **orders**: order-level data with customer linkage
- **order_items**: product-level transaction details (quantity, price)
- **products**: product catalog with categories

---

## Database Schema

customers
→ customer_id (PK), customer_name, city, signup_date

orders
→ order_id (PK), customer_id (FK), order_date, payment_method

order_items
→ order_id (FK), product_id (FK), quantity, price

products
→ product_id (PK), product_name, category, price

---

## Project Structure

```
ecommerce-sql-analytics/

dataset/
    customers.csv
    orders.csv
    order_items.csv
    products.csv

queries/
    01_revenue_trends.sql
    02_top_customers.sql
    03_product_performance.sql
    04_cohort_analysis.sql

results/
    revenue_trends.csv
    top_customers.csv
    product_performance.csv
    cohort_analysis.csv

README.md
```

---

## Key Analyses

### 1. Revenue Trends

- Monthly revenue analysis using transaction-level data
- Helps identify growth patterns and seasonality

**Metric:**

```
Revenue = SUM(quantity × price)
```

---

### 2. Top Customers

- Identifies high-value customers based on total spending
- Includes supporting metrics like order count and average order value

**Key Insight:**
Revenue contribution is more important than purchase frequency

---

### 3. Product Performance

- Determines which products generate the most revenue
- Evaluates demand using total quantity sold
- Provides category-level context

---

### 4. Cohort Analysis (Customer Retention)

- Groups customers by signup month
- Tracks how many customers return in subsequent months

**Purpose:**
Understand retention patterns and customer lifecycle behavior

---

## Key Insights (Example)

- Revenue shows consistent variation across months indicating seasonality
- A small group of customers contributes a large portion of total revenue
- Certain product categories dominate overall sales
- Customer retention declines over time, indicating potential engagement issues

---

## Tools & Technologies

- PostgreSQL
- SQL
- pgAdmin
- CSV datasets

---

## Learning Outcomes

- Writing complex SQL queries using joins and aggregations
- Understanding relational data modeling
- Applying business thinking to data analysis
- Performing cohort-based retention analysis
- Structuring a professional analytics project

---

## How to Run

1. Import CSV files into PostgreSQL
2. Create tables using schema definitions
3. Run queries from the `queries/` folder
4. Export results into the `results/` folder

---

## Future Improvements

- Add retention percentage matrix (cohort table format)
- Build interactive dashboard (Power BI / Tableau)
- Implement advanced SQL features (window functions, ranking)
- Automate data pipeline

---

## Author

Abhay

---
