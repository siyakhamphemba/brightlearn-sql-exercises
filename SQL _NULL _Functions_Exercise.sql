-- Databricks notebook source

-- Q1. Show all employees with their salary. If salary is NULL, display 0.
SELECT employee_id, name,
       IFNULL(salary, 0) AS salary_with_default
FROM workspace.brightlearn.Employees;

-- Q2. Show employee names with their department. If department is NULL, show "Not Assigned".
SELECT employee_id, name,
       IFNULL(department, 'Not Assigned') AS department_name
FROM workspace.brightlearn.Employees;

-- Q3. Find orders with NULL customer_id using ISNULL().
SELECT order_id, customer_id
FROM workspace.brightlearn.null_orders
WHERE ISNULL(customer_id);

-- Q4. Show all orders. If delivery_date is NULL, show 'Pending'.
SELECT order_id, customer_id,
       IFNULL(CAST(delivery_date AS STRING), 'Pending') AS delivery_status
FROM workspace.brightlearn.null_orders;

-- Q5. Show all students and their grades. Replace NULL with 0.
SELECT student_id, name,
       IFNULL(grade, 0) AS final_grade
FROM workspace.brightlearn.Students;

-- Q6. Count students who haven't been graded.
SELECT COUNT(*) AS not_graded_count
FROM workspace.brightlearn.Students
WHERE grade IS NULL;

-- Q7. Show product name, price, and final price after discount. Assume 0 if discount is NULL.
SELECT product_id, name,
       price - IFNULL(discount, 0) AS final_price
FROM workspace.brightlearn.Products;

-- Q8. Count how many customers have no email.
SELECT COUNT(*) AS missing_email_count
FROM workspace.brightlearn.Customers
WHERE email IS NULL;

-- Q9. Show all customers with email. If NULL, display "No Email".
SELECT customer_id, name,
       IFNULL(email, 'No Email') AS email_display
FROM workspace.brightlearn.Customers;

-- Q10. Show payment details with method replaced by "Unknown" if NULL.
SELECT payment_id,
       IFNULL(method, 'Unknown') AS method_display,
       status
FROM workspace.brightlearn.Payments;

-- Q11. Show items and their quantity (0 if NULL).
SELECT item_id, item_name,
       IFNULL(quantity, 0) AS quantity_checked
FROM workspace.brightlearn.Inventory;

-- Q12. Show employee ID and the first available value among bonus or commission.
SELECT emp_id,
       COALESCE(bonus, commission) AS first_available_reward
FROM workspace.brightlearn.Employees_Extra;

-- Q13. Count classes that don't have a room assigned.
SELECT COUNT(*) AS no_room_count
FROM workspace.brightlearn.Classes
WHERE room IS NULL;

-- Q14. Show attendance records with status. Replace NULL with "Not Marked".
SELECT student_id, date,
       IFNULL(status, 'Not Marked') AS attendance_status
FROM workspace.brightlearn.Attendance;

-- Q15. Show account ID, account_type (or 'Unknown'), and balance (or 0).
SELECT account_id,
       IFNULL(account_type, 'Unknown') AS type_display,
       IFNULL(balance, 0) AS balance_checked
FROM workspace.brightlearn.Bank_Accounts;

-- Q16. Show all projects with a start date. If start_date is NULL, display 'TBD'.
SELECT project_id, title,
       IFNULL(CAST(start_date AS STRING), 'TBD') AS start_display
FROM workspace.brightlearn.Projects;

-- Q17. Display reviews showing comment (or 'No Comment') and rating (or 0).
SELECT review_id, product_id,
       IFNULL(comment, 'No Comment') AS comment_display,
       IFNULL(rating, 0) AS rating_display
FROM workspace.brightlearn.Reviews;

-- Q18. Show the supplier contact number using COALESCE(phone, alt_phone, 'No Contact').
SELECT supplier_id, name,
       COALESCE(phone, alt_phone, 'No Contact') AS contact_number
FROM workspace.brightlearn.Suppliers;

-- Q19. Show all users and their preferences. Replace NULLs: Theme->'Light', Language->'English', Timezone->'UTC'.
SELECT user_id,
       IFNULL(theme, 'Light') AS theme_set,
       IFNULL(language, 'English') AS language_set,
       IFNULL(timezone, 'UTC') AS timezone_set
FROM workspace.brightlearn.User_Settings;

-- Q20. Show maintenance log. issue -> "Unknown Issue", technician -> "Not Assigned".
SELECT record_id, machine_id,
       IFNULL(issue, 'Unknown Issue') AS issue_log,
       IFNULL(technician, 'Not Assigned') AS technician_name
FROM workspace.brightlearn.Maintenance;
