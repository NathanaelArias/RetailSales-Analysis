# 🛍️ RetailSales Analysis with SQL Server

**Author:** Nathanael Arias  
**Date:** July 2025  
**Tools:** SQL Server  
**Dataset:** Online Retail.csv (from Kaggle)

---

## 📌 Project Overview

This project involves cleaning and analyzing online retail data using SQL Server. The dataset contains transactional data for a UK-based online retailer and includes information on invoices, products, quantities, customers, countries, and unit prices.

---

## 🧼 Data Cleaning Steps

- Deleted invalid rows (Quantity or UnitPrice ≤ 0)
- Standardized product descriptions to uppercase
- Removed leading/trailing spaces from descriptions
- Created a new column `TotalAmount` (Quantity * UnitPrice)
- Identified potential outliers for manual inspection

---

## 📊 Exploratory Data Analysis (EDA)

- **Top-selling products** by quantity
- **Most profitable products** by revenue
- **Top 3 countries** by total sales
- **Top customers** based on spending
- **Best months** and **best days of the week** for sales

---

## 🗂️ Files Included

- `retail_cleaning_analysis.sql`: Full SQL script including cleaning and EDA steps.
- `README.md`: Project documentation.

---

## 🔗 Dataset Source

[📥 Online Retail Dataset on Kaggle](https://www.kaggle.com/datasets/malikzeeshan1122/online-retail-dataset)

---

## 💼 About Me

I'm Nathanael Arias, a Data Analyst passionate about transforming raw data into valuable insights using SQL, Power BI, and Excel.

👉 [LinkedIn Profile](https://www.linkedin.com/in/nathanael-arias-a5591b200)

