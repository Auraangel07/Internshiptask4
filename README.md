# 🧠 Internship Task 4: SQL Query-Based Data Analysis

Welcome to **Task 4** of my Data Analyst Internship! This task focuses on writing and executing insightful **SQL queries** on a user dataset from a fashion-based consumer marketplace.

---

## 📊 Dataset Overview

The dataset contains anonymized user data, with the following attributes:

- User profile details (e.g., gender, country, civility)
- App usage data (Android/iOS, profile picture)
- Product interactions (listed, bought, sold, pass rate)
- Social metrics (followers, follows, liked products)
- Login and seniority history

**Table name used:** `data`

---

## ✅ Task Objective

- Perform deep SQL analysis to derive **actionable insights**.
- Explore engagement, usage behavior, app adoption, product activity, and demographics.
- Use SQL functions: `GROUP BY`, `JOIN`, `ORDER BY`, subqueries, `VIEWS`, and `INDEXES`.

---

## 🧾 File Structure

📁 Task4_SQL_Analysis
│
├── task4_full_queries.sql # 💥 Contains 42 optimized SQL queries
├── screenshots/ # 📸 Query result screenshots (optional)
└── README.md # 📘 You're reading it!

---

## 🔍 SQL Highlights

Here’s a glimpse of what’s inside the SQL file:

- 📌 **Top Countries** by user count, buyers, sellers
- 💁 **Gender & App Usage**: Android/iOS by gender
- 🧠 **Engagement Metrics**: Wished, bought, listed items
- 🚀 **Power Users**: Users with high pass rate & sales
- 🧱 **Views & Indexes**: For performance & modular analysis
- ⏱ **Activity Analysis**: Last login trends, seniority
- 🎯 **Subqueries**: Dynamic filters based on averages

---

## 🧠 Sample Queries

```sql
-- Top 5 users with most followers
SELECT identifierHash, socialNbFollowers
FROM data
ORDER BY socialNbFollowers DESC
LIMIT 5;

-- Country-wise average products sold
SELECT country, AVG(productsSold) AS avg_sold
FROM data
GROUP BY country;
---
```
🏁 Conclusion
This SQL task helped me explore real-life data-driven decision making using raw tabular data. Each query uncovers a unique dimension of user behavior, engagement, or performance.

📂 File to run: task4_full_queries.sql
📬 For any feedback or review, feel free to reach out!
