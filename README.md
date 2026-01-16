# 📖 Library Management System – SQL Project

## 📌 Project Overview

This project implements a **Library Management System** using SQL, handling **Books, Members, Employees, Branches, Issued and Return status**. The system tracks book issues, returns, rental income, and member activity while allowing employees to manage library operations efficiently.

The project demonstrates skills in **table creation, data integrity via foreign keys, joins, aggregations, CTAS, and query-based problem solving**.

---

## 🗂️ Database & Table Structure

### Tables

1. `branch` – Library branch details
2. `employees` – Employee records linked to branches
3. `books` – Books available in the library
4. `members` – Library members
5. `issued_status` – Records of books issued to members
6. `return_status` – Records of books returned

### Key Columns

* `branch.branch_id`, `employees.emp_id`, `books.isbn`, `members.member_id`, `issued_status.issued_id`, `return_status.return_id` as primary keys
* Foreign keys maintain relationships, e.g., `issued_status.issued_member_id → members.member_id`

---

## 🧹 Data Handling & Checks

* Checked all tables after creation using `SELECT * ... LIMIT 10`.
* Ensured **foreign key relationships** maintain integrity.
* Inserted new book records and updated member addresses.

---

## 📊 Key SQL Analysis & Operations

### 1️⃣ Basic CRUD Operations

* **Add new book**
* **Update member info**
* **Delete issued record**

### 2️⃣ Issue & Return Tracking

* Retrieve books issued by a specific employee
* List members with multiple issued books
* Find books not yet returned
* Generate summary tables for books issued (CTAS)

### 3️⃣ Revenue & Stock Analysis

* Total rental income by category
* Books with rental price above a certain threshold
* Books issued per category and per member

### 4️⃣ Employee & Branch Management

* List employees with their branch manager and branch details
* Retrieve employee info including salary, position, and branch

### 5️⃣ Member Insights

* List members registered in the last 700 days
* Identify active members based on books issued count

---

## 🧠 Advanced SQL Concepts Used

* Foreign key constraints for **data integrity**
* `JOIN`s across multiple tables
* `GROUP BY` and `HAVING` for aggregations
* `CTAS` (Create Table As Select) for generating summary tables
* `LEFT JOIN` to identify unreturned books
* Date arithmetic with `INTERVAL`
* Filtering and ordering for business-specific queries

---

## 🛠️ Tools & Technologies

* **Database:** PostgreSQL
* **Language:** SQL
* **Environment:** pgAdmin / PostgreSQL CLI

---

## 🎯 Key Learnings

* Designed a **multi-table relational schema** with dependencies
* Managed **book issuance and returns** tracking
* Learned advanced SQL for **summaries, revenue, and member analysis**
* Improved ability to write queries for **real-world library operations**

---

## 🚀 Future Improvements

* Include **book reservation and overdue tracking**
* Add **fine calculation** for late returns
* Build **dashboard visualizations** for branch performance and rental income
* Optimize queries for **large-scale libraries**

---

## 👤 Author

**Chandan Mistry**
CSE Student | Aspiring Data Analyst

📧 Contact: *(Add your email / LinkedIn here)*

---

⭐ *If you like this project, feel free to fork, star, or suggest improvements!*
