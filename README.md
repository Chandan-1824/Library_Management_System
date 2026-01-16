# 📖 Library Management System – SQL Project
---

## 📌 About the Project
This is a **Library Management System** built entirely using **SQL**. It’s designed to handle all essential library operations, including **book management, member tracking, employee and branch management, and book issue/return tracking**.  

The project also allows analysis of **rental income, book popularity, and member activity**, making it a practical example of how SQL can be used in real-world business scenarios.

> 💡 **Skills Demonstrated:** Relational database design, foreign key relationships, complex queries, aggregation, summary tables, and analytical SQL.

---

## 🗂️ Database Structure

The system consists of **6 main tables**:

| Table | Purpose |
|-------|--------|
| `branch`          | Stores branch information and managers |
| `employees`       | Employee records linked to branches |
| `books`           | Library book inventory with rental info |
| `members`         | Registered library members |
| `issued_status`   | Tracks books issued to members |
| `return_status`   | Tracks books returned |

**Relationships:**  
- Primary keys ensure each record is unique  
- Foreign keys maintain consistency (e.g., issued books link to members and employees)  

---

## 🔹 Key Features

### 📚 Book Management
- Add new books  
- Update book details  
- Delete obsolete records  

### 👥 Member Management
- Update member information  
- Track member activity and books issued  

### 📖 Issue & Return Tracking
- Find books issued by a specific employee  
- Identify members with multiple borrowed books  
- Check for unreturned books  
- Generate **summary tables** using `CTAS`  

### 💰 Revenue & Inventory Insights
- Calculate total rental income by category  
- Identify popular books and high-rental books  
- Analyze issuance per member and per category  

### 🏢 Employee & Branch Insights
- Display employees with their branch manager and branch details  
- View employee salary, position, and branch affiliation  

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
* **Tool For Data Cleaning:** Excel

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

📧 Contact: *chandanmistry844@gmail.com*

---

⭐ *If you like this project, feel free to fork, star, or suggest improvements!*
