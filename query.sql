-- =========================================================================
-- STEP 1: INITIAL WORKSPACE SETUP
-- =========================================================================
CREATE SCHEMA IF NOT EXISTS banking;

-- =========================================================================
-- CLEAN REFRESH: Drop existing tables in reverse dependency order
-- =========================================================================
DROP TABLE IF EXISTS banking.transactions CASCADE;
DROP TABLE IF EXISTS banking.accounts CASCADE;
DROP TABLE IF EXISTS banking.customers CASCADE;
DROP TABLE IF EXISTS banking.branches CASCADE;
DROP TABLE IF EXISTS banking.branch_targets CASCADE;

-- =========================================================================
-- STEP 2: CREATE BASE TABLES FIRST (No dependencies)
-- =========================================================================
CREATE TABLE banking.customers (
    customer_id INT PRIMARY KEY, 
    full_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE banking.branches (
    branch_id INT PRIMARY KEY, 
    branch_name VARCHAR(50)
);

CREATE TABLE banking.branch_targets (
    branch_code VARCHAR(10) PRIMARY KEY,
    target_amount NUMERIC(12,2)
);

-- =========================================================================
-- STEP 3: PRACTICE DDL ALTERATIONS (Runs cleanly now that customers exists)
-- =========================================================================
-- 1. ADD a new column for phone numbers
ALTER TABLE banking.customers ADD COLUMN phone_number VARCHAR(20);

-- 2. CHANGE the data type capacity from 20 to 30 characters
ALTER TABLE banking.customers ALTER COLUMN phone_number TYPE VARCHAR(30);

-- 3. RENAME the column to something more professional
ALTER TABLE banking.customers RENAME COLUMN phone_number TO contact_number;

-- 4. DROP the column completely if it's no longer needed
ALTER TABLE banking.customers DROP COLUMN contact_number;

-- =========================================================================
-- STEP 4: CREATE DEPENDENT TABLES (With Foreign Keys)
-- =========================================================================
CREATE TABLE banking.accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    balance NUMERIC(10,2) NOT NULL DEFAULT 0,
    opened_date DATE NOT NULL DEFAULT CURRENT_DATE,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT chk_account_balance CHECK(balance >= 0),
    CONSTRAINT chk_account_type CHECK(account_type IN ('Savings','Current','Fixed')),
    CONSTRAINT fk_accounts_customer FOREIGN KEY (customer_id) REFERENCES banking.customers(customer_id),
    CONSTRAINT fk_accounts_branch FOREIGN KEY (branch_id) REFERENCES banking.branches(branch_id)
);

CREATE TABLE banking.transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20) NOT NULL,
    amount NUMERIC(10, 2) NOT NULL,
    transaction_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    description TEXT,
    CONSTRAINT fk_transactions_account FOREIGN KEY (account_id) REFERENCES banking.accounts(account_id),
    CONSTRAINT chk_transactions_type CHECK (transaction_type IN ('Deposit', 'Withdraw')),
    CONSTRAINT chk_transactions_amount CHECK (amount > 0)
);

-- =========================================================================
-- STEP 5: INSERT INITIAL DATA INTO BASE TABLES
-- =========================================================================
INSERT INTO banking.customers (customer_id, full_name, city) VALUES
(1, 'Shreesha Saud', 'Kathmandu'),
(2, 'Sourav Gautam', 'Jhapa'),
(3, 'Deepa Bhattarai', 'Lalitpur'),
(4, 'Neha Pant', 'Kanchanpur'),
(5, 'Soniya Thapa', 'Kailali'),
(6, 'Riya Dhami', NULL);

INSERT INTO banking.branches (branch_id, branch_name) VALUES
(1, 'Kanchanpur Branch'),
(2, 'Kathmandu Branch'),
(3, 'Lalitpur Branch'),
(4, 'Jhapa Branch');

INSERT INTO banking.branch_targets (branch_code, target_amount) VALUES 
('KTM', 500000.00),
('KNR', 410000.00),
('JHP', 300000.00);

-- =========================================================================
-- STEP 6: DML OPERATIONS (Valid Data, Updates, and Deletes)
-- =========================================================================
INSERT INTO banking.accounts (account_id, customer_id, branch_id, account_number, account_type, balance) VALUES 
(1, 5, 1, 'ACT-1001', 'Savings', 15000.00), 
(2, 2, 2, 'ACT-1002', 'Current', 25000.00),
(3, 3, 3, 'ACT-1003', 'Savings', 8500.00),
(4, 4, 4, 'ACT-1004', 'Fixed', 120000.00),
(5, 1, 1, 'ACT-1005', 'Savings', 4500.00);

INSERT INTO banking.transactions (transaction_id, account_id, transaction_type, amount, description) VALUES 
(501, 1, 'Deposit', 5000.00, 'Salary'),
(502, 1, 'Withdraw', 1200.00, 'ATM cash'),
(503, 2, 'Deposit', 10000.00, 'Online Transfer'),
(504, 5, 'Deposit', 2500.00, 'Cash Deposit');

-- Simulate update
UPDATE banking.accounts SET balance = 7500.00 WHERE account_id = 1;

-- Insert account 2 (Valid placeholder for later)
INSERT INTO banking.accounts (account_id, customer_id, branch_id, account_number, account_type, balance)
VALUES (10, 5, 1, 'ACC-999', 'Savings', 1500.00);

-- 1. Delete the dependent records first
DELETE FROM banking.transactions WHERE account_id = 1;

-- 2. Now you can safely delete the parent account row
DELETE FROM banking.accounts WHERE account_id = 1;

-- =========================================================================
-- STEP 7: VIEW THE RESULTING TABLES
-- =========================================================================
SELECT * FROM banking.accounts;
SELECT * FROM banking.transactions;

-- ==========================================================================
-- STEP 8: PRACTICING QUERIES FROM LECTURE
-- ==========================================================================
-- To test 4-Table Chain Join (Typo 'transacation_type' fixed)
SELECT c.full_name, a.account_number, a.account_type, b.branch_name,
        t.transaction_id, t.transaction_type, t.amount, t.transaction_date
FROM banking.customers c
INNER JOIN banking.accounts a ON c.customer_id = a.customer_id
INNER JOIN banking.branches b ON a.branch_id = b.branch_id
INNER JOIN banking.transactions t ON a.account_id = t.account_id;

-- Testing the Multi aggregation block
SELECT
    COUNT(*) AS total_accounts,
    SUM(balance) AS total_bank_balance,
    ROUND(AVG(balance),2) AS average_account_balance,
    MIN(balance) AS lowest_balance,
    MAX(balance) AS highest_balance
FROM banking.accounts;

-- ==========================================================================
-- STEP 9: NEW LECTURE MATERIAL - GROUP BY, COALESCE, & HAVING
-- ==========================================================================

-- 1. Simple Grouping: Count accounts by their type
SELECT account_type, COUNT(*) AS account_count
FROM banking.accounts
GROUP BY account_type;

-- 2. Multi-Aggregation Grouping by Account Type
SELECT 
    account_type, 
    COUNT(*) AS account_count,
    SUM(balance) AS total_balance,
    ROUND(AVG(balance), 2) AS average_balance
FROM banking.accounts
GROUP BY account_type;

-- 3. Grouping after a JOIN with COALESCE to handle NULL values cleanly
SELECT 
    b.branch_id, 
    b.branch_name, 
    COUNT(a.account_id) AS account_count,
    COALESCE(SUM(a.balance), 0) AS total_balance
FROM banking.branches b
LEFT JOIN banking.accounts a ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name;

-- 4. Grouping by Multiple Columns (Branch + Account Type)
SELECT 
    b.branch_name, 
    a.account_type, 
    COUNT(*) AS account_count,
    SUM(a.balance) AS total_balance
FROM banking.accounts a
LEFT JOIN banking.branches b ON a.branch_id = b.branch_id
GROUP BY b.branch_name, a.account_type
ORDER BY b.branch_name, a.account_type;

-- 5. Filtering Aggregated Groups using HAVING (Total balance > 50,000)
SELECT account_type, SUM(balance) AS total_balance
FROM banking.accounts
GROUP BY account_type
HAVING SUM(balance) > 50000;

-- 6. Combining WHERE and HAVING (Filters rows first, then filters groups)
SELECT transaction_type, SUM(amount) AS total_amount
FROM banking.transactions
WHERE transaction_date >= '2026-01-01'  
GROUP BY transaction_type
HAVING COUNT(*) >= 2;

-- ==========================================================================
-- STEP 10: SUBQUERIES (Queries inside Queries)
-- ==========================================================================

-- 1. Scalar Subquery: Find accounts with balances higher than the bank average
SELECT account_id, account_number, balance
FROM banking.accounts
WHERE balance > (
    SELECT AVG(balance) FROM banking.accounts
);

-- 2. Multi-Row Subquery using IN: Find customers who have a Savings account
SELECT * FROM banking.customers
WHERE customer_id IN (
    SELECT customer_id FROM banking.accounts WHERE account_type = 'Savings'
);