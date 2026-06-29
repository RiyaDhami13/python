-- ====================================================================
-- DAY 4 ASSIGNMENT: SQL JOINS
-- ====================================================================

-- --------------------------------------------------------------------
-- Day 4, Task 1: INNER JOIN
-- Join employees and branches to return staff details and branch locations.
-- --------------------------------------------------------------------
SELECT
    e.full_name AS employee_name,
    e.job_title,
    e.salary,
    b.branch_name,
    b.branch_city
FROM banking.employees AS e
INNER JOIN banking.branches AS b
    ON e.branch_id = b.branch_id;

-- --------------------------------------------------------------------
-- Day 4, Task 2: LEFT JOIN (Branches and Employees)
-- Return all branches and their employees, including branches with no staff.
-- --------------------------------------------------------------------
SELECT
    b.branch_name,
    b.branch_city,
    e.full_name AS employee_name,
    e.job_title
FROM banking.branches AS b
LEFT JOIN banking.employees AS e
    ON b.branch_id = e.branch_id;

-- --------------------------------------------------------------------
-- Day 4, Task 3: Customer and loan report (LEFT JOIN)
-- Return all customers and their loans, including those without loans.
-- --------------------------------------------------------------------
SELECT
    c.customer_id,
    c.full_name AS customer_name,
    l.loan_id,
    l.loan_type,
    l.loan_amount,
    l.loan_status
FROM banking.customers AS c
LEFT JOIN banking.loans AS l
    ON c.customer_id = l.customer_id;

-- --------------------------------------------------------------------
-- Day 4, Task 4: RIGHT JOIN
-- Return all customers and any related loans, ensuring customers are on 
-- the right side of the join order.
-- --------------------------------------------------------------------
SELECT
    l.loan_id,
    l.loan_type,
    l.loan_amount,
    c.customer_id,
    c.full_name AS customer_name
FROM banking.loans AS l
RIGHT JOIN banking.customers AS c
    ON l.customer_id = c.customer_id;

-- --------------------------------------------------------------------
-- Day 4, Task 5: Loans and payments (LEFT JOIN)
-- Return all loans and their payments, including loans with no payments.
-- --------------------------------------------------------------------
SELECT
    l.loan_id,
    l.loan_type,
    l.loan_amount,
    p.payment_id,
    p.payment_amount,
    p.payment_date,
    p.payment_status
FROM banking.loans AS l
LEFT JOIN banking.loan_payments AS p
    ON l.loan_id = p.loan_id;

-- --------------------------------------------------------------------
-- Day 4, Task 6: Join four tables
-- Connect Customers, Loans, Branches, and Payments into a consolidated report.
-- --------------------------------------------------------------------
SELECT
    c.full_name AS customer_name,
    b.branch_name,
    l.loan_type,
    l.loan_amount,
    p.payment_amount,
    p.payment_date,
    p.payment_status
FROM banking.customers AS c
INNER JOIN banking.loans AS l
    ON c.customer_id = l.customer_id
INNER JOIN banking.branches AS b
    ON l.branch_id = b.branch_id
LEFT JOIN banking.loan_payments AS p
    ON l.loan_id = p.loan_id;

-- --------------------------------------------------------------------
-- Day 4, Task 7: Find missing relationships (LEFT JOIN + IS NULL)
-- --------------------------------------------------------------------

-- Customers without loans
SELECT
    c.customer_id,
    c.full_name
FROM banking.customers AS c
LEFT JOIN banking.loans AS l
    ON c.customer_id = l.customer_id
WHERE l.loan_id IS NULL;

-- Loans without payments
SELECT
    l.loan_id,
    l.loan_type,
    l.loan_amount
FROM banking.loans AS l
LEFT JOIN banking.loan_payments AS p
    ON l.loan_id = p.loan_id
WHERE p.payment_id IS NULL;

-- Branches without employees
SELECT
    b.branch_id,
    b.branch_name
FROM banking.branches AS b
LEFT JOIN banking.employees AS e
    ON b.branch_id = e.branch_id
WHERE e.employee_id IS NULL;

-- Customers without accounts
SELECT
    c.customer_id,
    c.full_name
FROM banking.customers AS c
LEFT JOIN banking.accounts AS a
    ON c.customer_id = a.customer_id
WHERE a.account_id IS NULL;

-- --------------------------------------------------------------------
-- Day 4, Task 8: FULL OUTER JOIN with target table
-- --------------------------------------------------------------------

-- 1. Create the targets table structure safely
CREATE TABLE banking.loan_targets (
    loan_type VARCHAR(20) PRIMARY KEY,
    target_amount NUMERIC(14,2) NOT NULL
);

-- 2. Populate targets to capture all outer join alignment scenarios
INSERT INTO banking.loan_targets (loan_type, target_amount)
VALUES 
('HOME', 5000000.00),     
('PERSONAL', 150000.00), 
('EDUCATION', 800000.00); 

-- 3. Execute the FULL OUTER JOIN comparison report
SELECT
    l.loan_type AS actual_loan_type,
    l.loan_amount AS actual_amount,
    t.loan_type AS target_loan_type,
    t.target_amount
FROM banking.loans AS l
FULL OUTER JOIN banking.loan_targets AS t
    ON l.loan_type = t.loan_type;