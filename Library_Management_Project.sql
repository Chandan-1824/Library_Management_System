-- Library Management system --

-- Creating Branch Table --
DROP TABLE IF EXISTS branch;
CREATE TABLE branch (
    branch_id VARCHAR(15) PRIMARY KEY,
	manager_id VARCHAR(15),
	branch_address VARCHAR(60),
	contact_no VARCHAR(20)
	
 );

DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
    emp_id VARCHAR(15) PRIMARY KEY,
	emp_name VARCHAR(50),
	position VARCHAR(20),
	salary  NUMERIC(10,2),
	branch_id VARCHAR(15),
	CONSTRAINT fk_branch
    FOREIGN KEY (branch_id)
    REFERENCES branch(branch_id)
	
 );

DROP TABLE IF EXISTS books;
CREATE TABLE books(
    isbn VARCHAR(50) PRIMARY KEY,
	book_title VARCHAR(80),
	category VARCHAR(25),
	rental_price NUMERIC(5,2),
	status VARCHAR(50),
	author VARCHAR(50),
	publisher VARCHAR(50)
	
);


DROP TABLE IF EXISTS members;
CREATE TABLE members(
	member_id VARCHAR(15) PRIMARY KEY,
	member_name VARCHAR(40),
	member_address VARCHAR(80),
	reg_date DATE
	
);

DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status(
	issued_id VARCHAR(15) PRIMARY KEY,
	issued_member_id VARCHAR(15),
	issued_book_name VARCHAR(80),
	issued_date DATE,
	issued_book_isbn VARCHAR(80),
	issued_emp_id VARCHAR(15),
	CONSTRAINT fk_members
    FOREIGN KEY (issued_member_id)
    REFERENCES members(member_id),
	CONSTRAINT fk_books
    FOREIGN KEY (issued_book_isbn)
    REFERENCES books(isbn),
	CONSTRAINT fk_employees
    FOREIGN KEY (issued_emp_id )
    REFERENCES employees(emp_id)
	
);

DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status(
	return_id VARCHAR(15) PRIMARY KEY,
	issued_id VARCHAR(15) , 
	return_book_name VARCHAR(80) , 
	return_date DATE ,
	return_book_isbn VARCHAR(20) ,
	CONSTRAINT fk_issue_id
    FOREIGN KEY (issued_id )
    REFERENCES issued_status(issued_id)
	
);

-- Checking the Imported Data --

SELECT * FROM books LIMIT 10;
SELECT * FROM branch LIMIT 10;
SELECT * FROM employees LIMIT 10;
SELECT * FROM issued_status LIMIT 10;
SELECT * FROM members LIMIT 10;
SELECT * FROM return_status LIMIT 10;


----- PROJECT PROBLEMS AND ANSWER QUERIES -----

--Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books 
(isbn,book_title,category,rental_price,status,author,publisher)
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

-- Update an Existing Member's Address
UPDATE  members 
SET member_address = '35 Side St'
WHERE member_id = 'C101';

--  Delete a Record from the Issued Status Table 
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

DELETE FROM issued_status 
WHERE issued_id = 'IS121';

-- Retrieve All Books Issued by a Specific Employee 
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT issued_id ,issued_emp_id, issued_book_name , issued_date 
FROM issued_status 
WHERE issued_emp_id = 'E101';

-- List Members Who Have Issued More Than One Book 
-- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT  issued_member_id, COUNT(issued_book_name) AS total_books_issued 
FROM issued_status 
GROUP BY issued_member_id
HAVING COUNT(issued_book_name) > 2
ORDER BY issued_member_id;

--Create Summary Tables: Used CTAS to generate new tables based on query results 
-- each book and total book_issued_cnt

CREATE TABLE new_table AS 
SELECT issued_book_name , COUNT(*) AS book_issued , issued_book_isbn
FROM issued_status
GROUP BY issued_book_name, issued_book_isbn;
--Check the table's  working--- 
select * FROM new_table;

-- Retrieve All Books in a Specific Category

SELECT * FROM books 
WHERE category = 'Classic';

-- Find Total Rental Income by Category:

SELECT b.category, COUNT(*) AS total_book_count ,  SUM(b.rental_price) as total_price_per_category
FROM books b 
JOIN issued_status ist
On  b.isbn = ist.issued_book_isbn
GROUP BY 1
ORDER BY COUNT(*) DESC;

--List Members Who Registered in the Last 700 Days:

SELECT * FROM members 
WHERE reg_date > CURRENT_DATE - INTERVAL '700 days' ;

--List Employees with Their Branch Manager's Name and their branch details:

SELECT e1.emp_name, 
	   e1.position , 
	   e1.salary ,
	   b.manager_id,
	   e2.emp_name as manager,
	   b.branch_address,
	   b.contact_no
FROM employees e1
JOIN branch b
ON e1.branch_id = b.branch_id
JOIN employees e2
ON e2.emp_id = b.manager_id;

SELECT * FROM employees;
-- Create a Table of Books with Rental Price Above a Certain Threshold:

CREATE TABLE new_books AS
SELECT  isbn, book_title , category ,rental_price, author, publisher
FROM books
WHERE rental_price > 6;

-- Retrieve the List of Books Not Yet Returned

SELECT ist.issued_book_name 
FROM issued_status ist 
LEFT JOIN return_status r
ON ist.issued_id = r.issued_id
WHERE r.issued_id IS NULL;




