# E-Commerce Data Analysis Using SQL

## Project Overview
This project uses SQL to explore and analyze an e-commerce database containing customer, product, order, order-item, and review data.

## Objective
The objective is to practise SQL queries to retrieve, filter, sort, group, and analyze structured data.

## Tools Used
- SQLite
- DB Browser for SQLite
- GitHub

## Dataset
The project uses the `ecommerce_project.db` SQLite database.

Dataset source: https://github.com/AjayiIsrael/Ecommerce-SQLite-Database

## SQL Concepts Covered
- `SELECT` and `WHERE`
- `ORDER BY` and `GROUP BY`
- Aggregate functions such as `SUM()`, `AVG()`, and `COUNT()`
- `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN`
- Subqueries
- Views
- Indexes and query execution plans
- Handling `NULL` values

## Project Files
- `ecommerce_project.db` — the SQLite database used for analysis
- `ecommerce-analysis.sql` — SQL queries written for the task
- `Screenshots/` — screenshots showing query outputs

## How to Run
1. Install [DB Browser for SQLite](https://sqlitebrowser.org/dl/).
2. Open `ecommerce_project.db` in DB Browser for SQLite.
3. Open the **Execute SQL** tab.
4. Open or paste queries from `ecommerce-analysis.sql`.
5. Execute each query and review the results.

## Analysis Performed
The SQL queries demonstrate:
- Retrieving customer and product records
- Filtering and sorting data
- Calculating revenue by product category
- Calculating average product prices
- Combining order items with product details
- Counting orders per customer
- Using a subquery to find products priced above the average
- Creating and querying a category-revenue view
- Creating an index and inspecting a query execution plan
- Checking for missing values with `IS NULL`

## Outcome
This project demonstrates foundational SQL data-analysis skills, including filtering, aggregation, relational joins, reusable views, and basic query-plan inspection.

## Interview Questions & Answers

1. **Difference between WHERE and HAVING:**
   - `WHERE` filters rows before any groupings or aggregations are calculated.
   - `HAVING` filters aggregated groups after the `GROUP BY` clause has been evaluated.

2. **Different types of joins:**
   - `INNER JOIN`: Returns records that have matching values in both tables.
   - `LEFT JOIN`: Returns all records from the left table, and matched records from the right table.
   - `RIGHT JOIN`: Returns all records from the right table, and matched records from the left table.
   - `FULL OUTER JOIN`: Returns all records when there is a match in either left or right table.

3. **Calculate Average Revenue Per User (ARPU) in SQL:**
   ```sql
   SELECT SUM(order_amount) * 1.0 / COUNT(DISTINCT user_id) AS arpu
   FROM orders;
