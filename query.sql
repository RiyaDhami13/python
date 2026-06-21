CREATE SCHEMA IF NOT EXISTS BANKING;
--accounts table
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
  CONSTRAINT chk_account_type CHECK(account_type IN ('Savings','Current','Fixed'))
)

-- transactions table
CREATE TABLE banking.transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20) NOT NULL,
    amount NUMERIC(10, 2) NOT NULL,
    transaction_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    description TEXT,

    -- Foreign Key Constraint (Transactions must point to a valid account)
    CONSTRAINT fk_transactions_account 
        FOREIGN KEY (account_id) 
        REFERENCES banking.accounts(account_id),

    -- Check Constraint (Type can only be Deposit or Withdraw)
    CONSTRAINT chk_transactions_type 
        CHECK (transaction_type IN ('Deposit', 'Withdraw')),

    -- Check Constraint (Amount must be positive)
    CONSTRAINT chk_transactions_amount 
        CHECK (amount > 0)
);

-- 1. ADD a new column for phone numbers
ALTER TABLE banking.customers ADD COLUMN phone_number VARCHAR(20);

-- 2. CHANGE the data type capacity from 20 to 30 characters
ALTER TABLE banking.customers ALTER COLUMN phone_number TYPE VARCHAR(30);

-- 3. RENAME the column to something more professional
ALTER TABLE banking.customers RENAME COLUMN phone_number TO contact_number;

-- 4. DROP the column completely if it's no longer needed
ALTER TABLE banking.customers DROP COLUMN contact_number;

INSERT INTO banking.accounts (account_id, customer_id, branch_id, account_number, account_type, balance)
VALUES (1, 101, 5, 'ACT-998822', 'Savings', 5000.00);

INSERT INTO banking.accounts (account_id, account_number, account_type, balance)
VALUES (2, 'ACT-111111', 'Savings', -50.00);

INSERT INTO banking.accounts (account_id, account_number, account_type, balance)
VALUES (3, 'ACT-222222', 'Student_Account', 100.00);

UPDATE banking.accounts
SET balance = 7500.00
WHERE account_id = 1;

DELETE FROM banking.accounts
WHERE account_id = 1;