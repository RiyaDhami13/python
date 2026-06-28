-- ====================================================================
-- DAY 3 ASSIGNMENT: SELECT, FILTERING, AND CASE EXPRESSIONS
-- ===================================================================

-- ----------------------------------------------------------------
-- Day 3, Task 1: Employee queries
-- ----------------------------------------------------------------

-- Return all employees with ID,name, title, salary, branch
SELECT
      e.employee_id,
      e.full_name,
      e.job_title,
      e.salary,
      e.branch_id
FROM banking.employees as e;

--Sort employees from highest salary to lowest
SELECT
      e.employee_id,
      e.full_name,
      e.job_title,
      e.salary,
      e.branch_id
FROM banking.employees as e
ORDER BY e.salary DESC;

--Return the highest paid employees
SELECT 
      e.employee_id,
      e.full_name,
      e.job_title,
      e.salary
FROM banking.employees as e
ORDER BY e.salary DESC
LIMIT 5;

--Return employees earning between 40K and 80K
SELECT
      e.employee_id,
      e.full_name,
      e.job_title,
      e.salary
FROM banking.employees AS e
WHERE e.salary BETWEEN 40000.00 AND 80000.00;

-- Return employees whose job title is Loan Officer, Branch Manager, or Data Analyst
SELECT
      e.employee_id,
      e.full_name,
      e.job_title,
      e.salary
FROM banking.employees AS e
WHERE e.job_title IN ('Loan Officer', 'Branch Manager', 'Data Analyst');

-- Return employees whose names contain 'ra', regardless of capitalization
SELECT
      e.employee_id,
      e.full_name,
      e.job_title
FROM banking.employees AS e
WHERE e.full_name ILIKE '%ra%';

-- Return inactive employees
SELECT
      e.employee_id,
      e.full_name,
      e.job_title
FROM banking.employees as e
WHERE e.is_active = FALSE;

-- ----------------------------------------------------------------------------------
-- Day3, Task 2:Loan Queries
-- ---------------------------------------------------------------------------------
--Return loans greater than 500,000
SELECT
      l.loan_id,
      l.customer_id,
      l.loan_type,
      l.loan_amount
FROM banking.loans AS l
WHERE l.loan_amount > 500000.00;

-- Return loans started during 2025
SELECT
      l.loan_id,
      l.customer_id,
      l.loan_type,
      l.start_date
FROM banking.loans AS l
WHERE l.start_date BETWEEN '2025-01-01' AND '2025-12-30';

--Return loans whose status is not closed
SELECT
      l.loan_id,
      l.loan_type,
      l.loan_amount,
      l.loan_status
FROM banking.loans as l
WHERE l.loan_status <> 'CLOSED';

--Sort loans by their amounts descending and ascending order
SELECT
      l.loan_id,
      l.loan_type,
      l.loan_amount,
      l.loan_status
FROM banking.loans as l
ORDER BY l.loan_status ASC, l.loan_amount DESC;
-- Return loans with interest rates between 5 and 10
SELECT
      l.loan_id,
      l.loan_type,
      l.interest_rate
FROM banking.loans AS l
WHERE l.interest_rate BETWEEN 5.00 AND 10.00;

-- Return loans of type HOME,AUTO or BUSINESS
SELECT
      l.loan_id,
      l.loan_type,
      l.loan_amount
FROM banking.loans as l
WHERE l.loan_type IN ('HOME','AUTO','BUSINESS');

-- -------------------------------------------------------------------------
-- Day 3, task 3: Payment Queries
-- ---------------------------------------------------------------------------

-- Return pending or failed payments
SELECT
      p.payment_id,
      p.loan_id,
      p.payment_amount,
      p.payment_status
FROM banking.loan_payments AS p
WHERE p.payment_status IN ('PENDING','FAILED');

-- Return payment made using online
SELECT
      p.payment_id,
      p.payment_amount,
      p.payment_method
FROM banking.loan_payments AS p
WHERE p.payment_status = "ONLINE";

-- Payments made betweeen two selected dates
SELECT
      p.payment_id,
      p.payment_amount,
      p.payment_date
FROM banking.loan_payments AS p
WHERE p.payment_date BETWEEN '2025-06-01' AND '2026-01-01';

-- Return where payment method is not null
SELECT
      p.payment_id,
      p.payment_amount,
      p.payment_method
FROM banking.loan_payments AS p
WHERE p.payment_status IS NOT NULL;

--Return the largest five payments
SELECT
      p.payment_id,
      p.payment_amount,
      p.payment_date
FROM banking.loan_payments AS p
ORDER BY p.payment_method DESC
LIMIT 5;

-- ----------------------------------------------------------------------------
-- Day 3, task 4: 







