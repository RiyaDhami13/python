-- =========================================================================
-- STEP 1: INITIAL WORKSPACE SETUP
-- =========================================================================
CREATE SCHEMA IF NOT EXISTS banking;

-- =========================================================================
-- STEP 2: CREATE BASE TABLES FIRST (No dependencies)
-- =========================================================================
CREATE TABLE banking.customers (
    customer_id INT PRIMARY KEY, 
    name VARCHAR(50)
);

CREATE TABLE banking.branches (
    branch_id INT PRIMARY KEY, 
    branch_name VARCHAR(50)
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
-- Note the added semicolon (;) at the end of this block to prevent the line 17 error!
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
INSERT INTO banking.customers VALUES (101, 'Riya');
INSERT INTO banking.branches VALUES (1, 'Mahendranagar Branch');
INSERT INTO banking.branches VALUES (5, 'Dhangadhi Branch'); -- Added branch 5 since account 1 uses it

-- =========================================================================
-- STEP 6: DML OPERATIONS (Valid Data, Updates, and Deletes)
-- =========================================================================
-- Insert account 1
INSERT INTO banking.accounts (account_id, customer_id, branch_id, account_number, account_type, balance)
VALUES (1, 101, 5, 'ACT-998822', 'Savings', 5000.00);

-- Simulate update
UPDATE banking.accounts SET balance = 7500.00 WHERE account_id = 1;

-- Insert account 2 (Valid placeholder for later)
INSERT INTO banking.accounts (account_id, customer_id, branch_id, account_number, account_type, balance)
VALUES (10, 101, 1, 'ACC-999', 'Savings', 1500.00);

-- Simulate delete on account 1
DELETE FROM banking.accounts WHERE account_id = 1;

-- =========================================================================
-- STEP 7: VIEW THE RESULTING TABLES
-- =========================================================================
SELECT * FROM banking.accounts;
SELECT * FROM banking.transactions;