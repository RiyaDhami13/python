-- ====================================================================
-- DAY 5 ASSIGNMENT: GROUPING AND AGGREGATIONS
-- ====================================================================

-- --------------------------------------------------------------------
-- Day 5, Task 1: Basic Aggregations
-- --------------------------------------------------------------------

-- Total number of employees in the bank
SELECT 
    COUNT(*) AS total_employees 
FROM banking.employees;

-- Total salary payout across the entire bank
SELECT 
    SUM(salary) AS total_salary_payout 
FROM banking.employees;

-- Average, highest, and lowest loan amounts across the system
SELECT 
    ROUND(AVG(loan_amount), 2) AS average_loan_amount,
    MAX(loan_amount) AS highest_loan_amount,
    MIN(loan_amount) AS lowest_loan_amount
FROM banking.loans;

-- Total number of payments made and total collected revenue
SELECT 
    COUNT(*) AS total_payments_processed,
    SUM(payment_amount) AS total_revenue_collected
FROM banking.loan_payments
WHERE payment_status = 'COMPLETED';


-- --------------------------------------------------------------------
-- Day 5, Task 2: GROUP BY Queries
-- --------------------------------------------------------------------

-- Count of employees and total salary expense broken down by job title
SELECT 
    job_title,
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary_expense
FROM banking.employees
GROUP BY job_title
ORDER BY total_salary_expense DESC;

-- Total number of loans and total loan amount approved for each loan type
SELECT 
    loan_type,
    COUNT(*) AS total_loans_issued,
    SUM(loan_amount) AS total_allocated_capital
FROM banking.loans
GROUP BY loan_type
ORDER BY total_allocated_capital DESC;

-- Count of payments and total amount processed by each payment method
SELECT 
    payment_method,
    COUNT(*) AS payment_count,
    SUM(payment_amount) AS total_processed_amount
FROM banking.loan_payments
GROUP BY payment_method
ORDER BY payment_count DESC;


-- --------------------------------------------------------------------
-- Day 5, Task 3: Multi-Table Grouping (JOIN + GROUP BY)
-- --------------------------------------------------------------------

-- Total number of employees assigned to each branch location
SELECT 
    b.branch_name,
    b.city,
    COUNT(e.employee_id) AS total_staff
FROM banking.branches AS b
LEFT JOIN banking.employees AS e
    ON b.branch_id = e.branch_id
GROUP BY b.branch_id, b.branch_name, b.city
ORDER BY total_staff DESC;

-- Total active loan capital managed by each individual branch
SELECT 
    b.branch_name,
    COUNT(l.loan_id) AS active_loans_count,
    SUM(l.loan_amount) AS total_loan_capital
FROM banking.branches AS b
INNER JOIN banking.loans AS l
    ON b.branch_id = l.branch_id
WHERE l.loan_status = 'ACTIVE'
GROUP BY b.branch_id, b.branch_name
ORDER BY total_loan_capital DESC;


-- --------------------------------------------------------------------
-- Day 5, Task 4: HAVING Clause Queries (Filtering Aggregates)
-- --------------------------------------------------------------------

-- Show job titles where the total salary pool exceeds 100,000
SELECT 
    job_title,
    COUNT(*) AS staff_count,
    SUM(salary) AS total_salary_pool
FROM banking.employees
GROUP BY job_title
HAVING SUM(salary) > 100000.00;

-- Show branches managing more than 2 active or closed loans
SELECT 
    b.branch_name,
    COUNT(l.loan_id) AS loan_count
FROM banking.branches AS b
INNER JOIN banking.loans AS l
    ON b.branch_id = l.branch_id
GROUP BY b.branch_id, b.branch_name
HAVING COUNT(l.loan_id) > 2;

-- Show loans that have accumulated a total payment amount greater than 40,000
SELECT 
    loan_id,
    COUNT(payment_id) AS successful_installments,
    SUM(payment_amount) AS total_amount_paid
FROM banking.loan_payments
WHERE payment_status = 'COMPLETED'
GROUP BY loan_id
HAVING SUM(payment_amount) > 40000.00
ORDER BY total_amount_paid DESC;