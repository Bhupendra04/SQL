CREATE DATABASE STUDENTMANAGEMENTSYSTEM;
USE STUDENTMANAGEMENTSYSTEM;
CREATE TABLE STUDENT(
STUDENT_ID INT PRIMARY KEY,F_NAME VARCHAR(50),L_NAME VARCHAR(50),
D_O_B DATE,GENDER VARCHAR(50),EMAIL VARCHAR(50),PHONE VARCHAR(15)
);

CREATE TABLE COURSE(COURSE_ID INT PRIMARY KEY,
COURSE_TITLE VARCHAR(50), CREDITS INT);

CREATE TABLE INSTRUCTOR(INSTRUCTOR_ID INT PRIMARY KEY,
F_NAME VARCHAR(50),L_NAME VARCHAR(50),EMAIL VARCHAR(50));

CREATE TABLE ENROLLMENT(ENROLLMENT_ID INT PRIMARY KEY,
ENROLLMENT_DATE DATE,STUDENT_ID INT,COURSE_ID INT, 
INSTRUCTOR_ID INT,
FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT(STUDENT_ID), 
FOREIGN KEY (COURSE_ID) REFERENCES COURSE(COURSE_ID),
FOREIGN KEY (INSTRUCTOR_ID) REFERENCES INSTRUCTOR(INSTRUCTOR_ID));

CREATE TABLE SCORE (SCORE_ID INT PRIMARY KEY,
COURSE_ID INT,STUDENT_ID INT,D_O_EXAM DATE,CREDIT_OBTAINED INT,
FOREIGN KEY (COURSE_ID) REFERENCES COURSE(COURSE_ID),
FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT(STUDENT_ID));

CREATE TABLE FEEDBACK(FEEDBACK_ID INT PRIMARY KEY,STUDENT_ID INT,
DATE DATE,INSTRUCTOR_NAME VARCHAR(50),FEEDBACK VARCHAR(255),
FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT(STUDENT_ID));
 
 
-- Use the Database and table from Day 1 lab. Insert 5 records in each table and retrieve data from all tables and display

INSERT INTO STUDENT(STUDENT_ID,F_NAME,L_NAME,D_O_B,GENDER,EMAIL,PHONE)
VALUES
(101,'Aarav', 'Sharma', '1995-03-12', 'Male', 'aarav.sharma@example.com', '9876543210'),
(102,'Riya', 'Singh', '1993-07-25', 'Female', 'Riya.singh@example.com', '9123456789'),
(103,'Jane', 'Smith', '1992-01-04', 'Male', 'JANE@example.com', '9234567890'),
(104,'Neha', 'Reddy', '1994-09-19', 'Female', 'neha.reddy@example.com', '9345678901'),
(105,'Vishal', 'Patel', '1990-12-08', 'Male', 'vishal.patel@example.com', '9456789012');

SELECT * FROM STUDENT;

INSERT INTO COURSE(COURSE_ID,COURSE_TITLE,CREDITS)
VALUES 
(1001, 'Introduction to Computer Science', 3),
(1002, 'Data Structures', 4),
(1003, 'Database Management Systems', 3),
(1004, 'Operating Systems', 4),
(1005, 'Computer Networks', 3);

SELECT * FROM COURSE;

INSERT INTO INSTRUCTOR(INSTRUCTOR_ID,F_NAME,L_NAME,EMAIL)
VALUES 
(10001, 'John', 'Doe', 'john.doe@example.com'),
(10002, 'Jane', 'Smith', 'jane.smith@example.com'),
(10003, 'Michael', 'Brown', 'michael.brown@example.com'),
(10004, 'Emily', 'Davis', 'emily.davis@example.com'),
(10005, 'David', 'Wilson', 'david.wilson@example.com');

SELECT * FROM INSTRUCTOR;

INSERT INTO ENROLLMENT(ENROLLMENT_ID,ENROLLMENT_DATE,STUDENT_ID,COURSE_ID,INSTRUCTOR_ID)
VALUES 
(11, '2024-01-15', 101, 1001, 10001),
(12, '2024-01-16', 102, 1002, 10002),
(13, '2024-01-17', 103, 1003, 10003),
(14, '2024-01-18', 104, 1004, 10004),
(15, '2024-01-19', 105, 1005, 10005);

INSERT INTO SCORE (SCORE_ID, COURSE_ID, STUDENT_ID, D_O_EXAM, CREDIT_OBTAINED)
VALUES 
(201, 2001, 101 ,'2024-06-01', 3),
(202, 2002, 102, '2024-06-02', 4),
(203, 2003, 103, '2024-06-03', 3),
(204, 2004, 104, '2024-06-04', 4),
(205, 2005, 105, '2024-06-05', 3);

INSERT INTO FEEDBACK (FEEDBACK_ID, STUDENT_ID, INSTRUCTOR_NAME, FEEDBACK)
VALUES 
(1, 101, 'John', 'Excellent teaching style and very helpful.'),
(2, 102, 'Jane', 'Good course materials, but pace was fast.'),
(3, 103, 'Michael', 'Very knowledgeable and engaging instructor.'),
(4, 104, 'Emily', 'Clear explanations and practical examples.'),
(5, 105, 'David', 'Supportive and approachable, great experience.');


-- Task 1: Update the Student table with the following information:
-- Change the email to 'jane_Smith@example.com' Where FirstName is 'Jane' and LastName is 'Smith';
UPDATE STUDENT
SET EMAIL = 'jane_smith@example.com'
WHERE F_NAME = 'Jane' AND L_NAME = 'Smith';


-- Update the Instructor with the following information: Change the email to 'davidwilson@example.com'
-- Where FirstName of the instructor is 'David' and LastName is 'Wilson'
UPDATE INSTRUCTOR 
SET EMAIL='davidwilson@example.com' 
WHERE F_NAME='David' AND L_NAME='Wilson';


-- Task 2: Delete record from the Student table on following condition: 
-- Delete student/students records from the Student table where last name is Smith.
DELETE FROM STUDENT
WHERE L_NAME = 'Smith';


-- Task 3: List the student whose first name starts with J. 
SELECT * 
FROM STUDENT
WHERE F_NAME LIKE 'J%';


-- Lab 1: Database Schema: Consider a simple database with one tables: BankAccount BankAccount Table:
-- Columns: account_id (Primary Key), account_holder_name, account_bal
CREATE DATABASE BANK_DB;
USE BANK_DB;
CREATE TABLE BANKACCOUNT(ACCOUNT_ID INT PRIMARY KEY, HOLDER_NAME VARCHAR(50),BALANCE DECIMAL(15));


-- Task 1: Insert Data
-- Write an SQL INSERT statement to insert data into the BankAccount table.
INSERT INTO BANKACCOUNT (ACCOUNT_ID, HOLDER_NAME, BALANCE)
VALUES 
(101, 'Alice Johnson', 25000),
(102, 'Bob Smith', 40000),
(103, 'Charlie Brown', 35000),
(104, 'Diana Prince', 45000),
(105, 'Ethan Hunt', 20000);


-- Task 2: Retrieving Data
-- Write an SQL SELECT statement to retrieve the account_holder_name and
-- account_balance of all account holders from the BankAccount table.
SELECT HOLDER_NAME, BALANCE
FROM BANKACCOUNT;


-- Task 3: Filtering Data
-- Write an SQL SELECT statement to retrieve the account_holder_name and
-- account_balance where the account_balance is more than 30,000.
SELECT HOLDER_NAME, BALANCE 
FROM BANKACCOUNT
WHERE BALANCE > 30000;


-- Task 4: Updating Data
-- Write an SQL UPDATE statement to change the account_balance of the a
-- account_balance of the account
-- holder whose ID is 101.
UPDATE BANKACCOUNT
SET BALANCE = 30000.00
WHERE ACCOUNT_ID = 101;


/* Scenario 1: In an employee database, you want to retrieve information about
employees who belong to the "Sales" department and have a salary greater than
50,000. */
SELECT * FROM employees WHERE department = 'Sales' AND salary > 50000;


/* Scenario 2: An employee has resigned, and you need to remove their record from the
"employees" table. Write an SQL DELETE query for this*/
 DELETE FROM employees WHERE resignation_status = 'Resigned';


/* Scenario 3: You want to delete all orders placed before '2022-01-01' that are still in the
'Pending' status. Write an SQL DELETE query for this.*/
 DELETE FROM orders WHERE order_date < '2022-01-01' AND status = 'Pending';


/* Scenario 4: You want to remove all products from the "Discontinued" category as they
are no longer available. Write an SQL DELETE query for this*/
 DELETE FROM products WHERE category = 'Discontinued';


/* Scenario 5: Employees in the "Sales" department are getting a bonus, and you want to
add 1000 to the bonus column for all employees in that department. Write an SQL
UPDATE query for this.*/
UPDATE employees SET bonus = bonus + 1000 WHERE department = 'Sales';


/* Lab 1-
Database Schema:
Use the same database scheme created in Previous Lab.

Task: Let's consider a scenario where you want to retrieve information about students
from a database table named student and display the results in ascending order based
on their last names.
Hint: Use orderBy clause in a ascending Order*/
SELECT * FROM student ORDER BY l_name;


/* Lab 2-
Database Schema:
Use the same database scheme created in Previous Lab.
Task: Let's consider a scenario where you want to count the number of students based
on their gender from a database table named Student.
Hint: use GroupBy clause and Count() function*/ 
SELECT gender, COUNT(*) AS student_count FROM Student GROUP BY gender;


/* Scenario 1:Library Books
Given a table called books with columns book_id, title, and author_id, write a query to
count the number of books written by each author, ordering the results by the author's
name without using a join clause.*/
SELECT b.author_id, a.author_name, 
COUNT(b.book_id) AS book_count
FROM books b, authors a
WHERE b.author_id = a.author_id
GROUP BY b.author_id, a.author_name
ORDER BY a.author_name ;


/* Database Schema
Already we have created an Employee table in day 2 lab,let’s utilize this.

Task: Add two more columns in the Employee table named Salary and department and
add data into it.*/
ALTER TABLE employee
ADD COLUMN salary DECIMAL(10, 2),
ADD COLUMN department VARCHAR(100);

INSERT INTO employee (employee_id, name, salary, department)
VALUES (1, 'John Doe', 60000, 'IT'),
       (2, 'Jane Smith', 45000, 'HR'),
       (3, 'Sam Johnson', 55000, 'IT'),
       (4, 'Alice Williams', 70000, 'Finance');


/* Write a query to retrieve all employees from the "employee" table who have a salary greater than 50000
and are in the 'IT' department . Now Imagine you work for a company with various departments, and
there is a need to analyze employee salaries within the IT department.*/
 SELECT * FROM employee WHERE salary > 50000 AND department = 'IT';


/* Use our database Ecommerce to complete the task.
Task: Imagine you are managing an e-commerce platform, and the holiday season is
approaching. To capitalize on the festive spirit and boost sales, you decide to organize a
special seasonal sale featuring electronics. The goal is to offer discounts on electronics
and include products with a price less than rs. 70,000 in the promotion.Write a query to
find products from the "product" table that are either in the 'Electronics' category or
have a
PRICE LESS THAN 70000*/
SELECT * FROM product WHERE category = 'Electronics' OR price < 70000;


/* Task: Imagine you are an HR analyst responsible for conducting a comprehensive
analysis of average salaries across different departments within a company. The goal is
to understand and compare the average salaries of employees in various
departments.Write a query to Calculate the average salary of employee in each
department from the "employee" table.
Hint: Use AVG() function and GROUP BY clause to create the query.*/
 SELECT department, AVG(salary) AS average_salary FROM employee GROUP BY department;


/* Scenario 1: Determine the average age of employees in each department from the
"employees" table.
We have an "Employee" table with the following columns: employee_id,
employee_name, department, and salary and you want to find the average salary for
each department. */
 SELECT department, AVG(salary) AS average_salary FROM employee GROUP BY department;


/* Assignment 1:
Task1: Assume you are managing a database of student records, and you need to
retrieve information about students born after June 16, 2009. What will be the sql query
for this?*/
SELECT *
FROM students
WHERE date_of_birth > '2009-06-16';


/* Task2: Assume you have a database containing a "Student" table with information
about students, including their first names. You want to retrieve records of students
whose first names start with either 'A' or 'J'. To achieve this,what will be your sql query?*/
SELECT *
FROM Student
WHERE first_name LIKE 'A%' 
   OR first_name LIKE 'J%';


/* Task 3 .Let's consider a scenario where you have a database with a "Student" table that
contains information about students, including their first names and email addresses.
You want to retrieve records of students whose first name is not 'Alice' and whose email
addresses contain the domain '@example.com'. To achieve this, what will be your sql
query?*/
SELECT *
FROM Student
WHERE first_name != 'Alice'
  AND email LIKE '%@example.com';


/* Task1: Create a table Person with PersonID int, FirstName varchar(255),
LastName varchar(255) and age (int).
Make PersonID PRIMARY KEY.*/
CREATE TABLE Person (
    PersonID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Age INT
);


/* Task2: Create a table Employee with emp_id int, first_name varchar(255),
last_name varchar(255) and age (int )
Make emp_id PRIMARY KEY.*/
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    age INT
);


/* Task 3: Insert data to Person table*/
INSERT INTO Person (PersonID, FirstName, LastName, Age)
VALUES
(1, 'John', 'Doe', 30),
(2, 'Jane', 'Smith', 25),
(3, 'Alice', 'Johnson', 28);

/* Task 4: Insert data to Employee table */
INSERT INTO Employee (emp_id, first_name, last_name, age)
VALUES
(101, 'Michael', 'Brown', 35),
(102, 'Emily', 'Davis', 40),
(103, 'David', 'Miller', 32);


/* Scenario 1: In a student grades database with tables for courses and grades, find the
courses where the average grade is below a 'C' (consider 'C' as a passing grade).
We have a "Course" table with the following columns:
CourseId,CourseName,CreditHours and
"Grade" table with the following a columns: StudentId(Foreign Key),CourseID(Foreign
Key),Grade*/

SELECT c.CourseId, c.CourseName
FROM Course c
JOIN Grade g ON c.CourseId = g.CourseId
GROUP BY c.CourseId, c.CourseName
HAVING AVG(
    CASE
        WHEN g.Grade = 'A' THEN 4
        WHEN g.Grade = 'B' THEN 3
        WHEN g.Grade = 'C' THEN 2
        WHEN g.Grade = 'D' THEN 1
        WHEN g.Grade = 'F' THEN 0
        ELSE NULL
    END
) < 2;




