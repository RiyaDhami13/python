-- ====================================================================
-- DAY 6 ASSIGNMENT: VIEWS, CTEs, AND WINDOW FUNCTIONS
-- ====================================================================

-- --------------------------------------------------------------------
-- Day 6, Task 1: Creating Views
-- --------------------------------------------------------------------

-- 1. Virtual View: Real-Time Active Loans with Customer Details
CREATE OR REPLACE VIEW banking.v_active_loans_summary AS
SELECT
    l.loan_id,
    c.full_name AS customer_name,
    l.loan_type,
    l.loan_amount,
    l.interest_rate,
    l.loan_status
FROM banking.loans AS l
INNER JOIN banking.customers AS c
    ON l.customer_id = c.customer_id
WHERE l.loan_status = 'ACTIVE';

-- Test the Active Loans View
SELECT * FROM banking.v_active_loans_summary;


-- 2. Virtual View: Real-Time Branch Staffing Footprint
CREATE OR REPLACE VIEW banking.v_branch_staffing_profile AS
SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    COUNT(e.employee_id) AS total_staff,
    COALESCE(SUM(e.salary), 0.00) AS total_salary_investment
FROM banking.branches AS b
LEFT JOIN banking.employees AS e
    ON b.branch_id = e.branch_id
GROUP BY b.branch_id, b.branch_name, b.city;

-- Test the Branch Staffing View
SELECT * FROM banking.v_branch_staffing_profile;


-- --------------------------------------------------------------------
-- Day 6, Task 2: Common Table Expressions (CTEs)
-- --------------------------------------------------------------------

-- CTE to isolate branches with high loan asset risk allocations (> 500,000)
WITH branch_capital_risk_cte AS (
    SELECT
        branch_id,
        COUNT(loan_id) AS active_loan_count,
        SUM(loan_amount) AS total_risk_exposure
    FROM banking.loans
    WHERE loan_status = 'ACTIVE'
    GROUP BY branch_id
)
SELECT
    b.branch_name,
    b.city,
    r.active_loan_count,
    r.total_risk_exposure
FROM banking.branches AS b
INNER JOIN branch_capital_risk_cte AS r
    ON b.branch_id = r.branch_id
WHERE r.total_risk_exposure > 500000.00;


-- --------------------------------------------------------------------
-- Day 6, Task 3: Window Functions (ROW_NUMBER, RANK, DENSE_RANK)
-- --------------------------------------------------------------------

-- Compare the ranking variations on employee salaries across the bank
SELECT
    e.employee_id,
    e.full_name,
    e.job_title,
    e.salary,
    ROW_NUMBER() OVER (ORDER BY e.salary DESC) AS unique_seq_num,
    RANK() OVER (ORDER BY e.salary DESC) AS standard_rank,
    DENSE_RANK() OVER (ORDER BY e.salary DESC) AS dense_rank_no_gaps
FROM banking.employees AS e;


-- --------------------------------------------------------------------
-- Day 6, Task 4: Partitioned Window Functions
-- --------------------------------------------------------------------

-- Rank employees inside their individual branch partitions to find local top earners
SELECT
    e.branch_id,
    e.full_name,
    e.job_title,
    e.salary,
    DENSE_RANK() OVER (
        PARTITION BY e.branch_id 
        ORDER BY e.salary DESC
    ) AS branch_salary_rank
FROM banking.employees AS e;