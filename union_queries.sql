-- Databricks notebook source

-- BRIGHTLEARN DATA ANALYTICS
-- UNION & UNION ALL Exercise
-- Platform: Databricks SQL

-- Q1. Combine account holders from both branches - unique list.

SELECT account_id, account_holder, 'Sandton' AS city
FROM workspace.brightlearn.branch_sandton_accounts
UNION
SELECT account_id, account_holder, 'Rosebank' AS city
FROM workspace.brightlearn.branch_rosebank_accounts;

-- Q2. Build a unique product catalogue from both product lists.

SELECT product_code, product_name, 'Savings' AS product_type
FROM workspace.brightlearn.savings_products
UNION
SELECT product_code, product_name, 'Current' AS product_type
FROM workspace.brightlearn.current_products;

-- Q3. Unique list of all staff from Retail and Corporate Banking.

SELECT staff_id, staff_name, 'retail@nexbank.com' AS email
FROM workspace.brightlearn.retail_banking_staff
UNION
SELECT staff_id, staff_name, 'corporate@nexbank.com' AS email
FROM workspace.brightlearn.corporate_banking_staff;

-- Q4. Unique list of all cities where NexBank serves customers.

SELECT city_code, city_name, 'Mobile' AS region
FROM workspace.brightlearn.mobile_branch_cities
UNION
SELECT city_code, city_name, 'Digital' AS region
FROM workspace.brightlearn.digital_branch_cities;


-- Q5. Unique list of every customer targeted by either campaign.

SELECT customer_id, customer_name, 'Push Notification' AS segment
FROM workspace.brightlearn.push_notification_targets
UNION
SELECT customer_id, customer_name, 'In-App Banner' AS segment
FROM workspace.brightlearn.inapp_banner_targets;

-- Q6. Complete log of ALL ATM transactions - keep duplicates.

SELECT txn_id AS transaction_id, account_id, amount,
       CURRENT_DATE() AS transaction_date
FROM workspace.brightlearn.atm01_transactions
UNION ALL
SELECT txn_id AS transaction_id, account_id, amount,
       CURRENT_DATE() AS transaction_date
FROM workspace.brightlearn.atm02_transactions;

-- Q7. Full list of all loan applications from both regions.

SELECT app_id AS application_id, customer_id, loan_type,
       NULL AS amount_requested
FROM workspace.brightlearn.gauteng_loan_applications
UNION ALL
SELECT app_id AS application_id, customer_id, loan_type,
       NULL AS amount_requested
FROM workspace.brightlearn.western_cape_loan_applications;

-- Q8. Full record of every complaint from email and app.

SELECT complaint_id, customer_id, 'Email' AS category,
       CURRENT_DATE() AS logged_date
FROM workspace.brightlearn.email_complaints
UNION ALL
SELECT complaint_id, customer_id, 'App' AS category,
       CURRENT_DATE() AS logged_date
FROM workspace.brightlearn.app_complaints;

-- Q9. All payment records from April and May combined.

SELECT payment_id, account_id, amount,
       CURRENT_DATE() AS payment_date
FROM workspace.brightlearn.april_payments
UNION ALL
SELECT payment_id, account_id, amount,
       CURRENT_DATE() AS payment_date
FROM workspace.brightlearn.may_payments;

-- Q10. Combine all debit and credit entries into one ledger.

SELECT entry_id, account_id, entry_type,
       NULL AS amount, CURRENT_DATE() AS entry_date
FROM workspace.brightlearn.debit_entries
UNION ALL
SELECT entry_id, account_id, entry_type,
       NULL AS amount, CURRENT_DATE() AS entry_date
FROM workspace.brightlearn.credit_entries;


-- BONUS 1: Use UNION - unique list of high risk customers
-- from January and February watch lists (no duplicates needed)
-- ANSWER: Use UNION because the goal is a unique list.
-- If a customer appeared on both watch lists, UNION removes
-- the duplicate so they appear only once.


-- BONUS 2: Use UNION ALL - count every transaction in Q1
-- even if recorded in two systems on the same day.
-- ANSWER: Use UNION ALL because every individual transaction
-- must be counted including duplicates. UNION would remove
-- duplicates and give an inaccurate total count.



-- BONUS 3: The query fails because the first SELECT returns
-- 2 columns but the second returns 3 columns.
-- UNION requires both queries to have the same number of columns.
-- FIX: Add a city column to the first SELECT.

SELECT account_id, account_holder, 'Sandton' AS city
FROM workspace.brightlearn.branch_sandton_accounts
UNION
SELECT account_id, account_holder, city
FROM workspace.brightlearn.branch_rosebank_accounts;
