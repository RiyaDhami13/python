-- =====================================================================================
-- Day 1: Assignment : DATABASE DESIGN AND TABLE CREATION 
-- Target Schema is banking
-- =====================================================================================

-- ------------------------------------------------------------
-- Day 1 Task 1: The Employees Table 
-- -------------------------------------------------------------
CREATE TABLE banking.employees (
  employee_id INT,
  branch_id INT,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL,
  job_title VARCHAR(50) NOT NULL,
  salary  NUMERIC(12,2) NOT NULL,
  hire_date DATE NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,

-- Table Constraints
  CONSTRAINT pk_employees PRIMARY KEY (employee_id),
  CONSTRAINT fk_employees_branch FOREIGN KEY (branch_id) REFERENCES banking.branches (branch_id),
  CONSTRAINT uq_employee_email UNIQUE (email),
  CONSTRAINT chk_employee_salary CHECK (salary > 0)
);

-- ------------------------------------------------------------------------------------
-- DAY 1, TASK 2: CREATE THE LOANS TABLE
-- ------------------------------------------------------------------------------------
CREATE TABLE banking.loans (
  loan_id INT,
  customer_id INT,
  branch_id INT,
  loan_type  VARCHAR(20) NOT NULL,
  loan_amount NUMERIC(14,2) NOT NULl,
  interest_rate NUMERIC(5,2) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  loan_status VARCHAR(20) DEFAULT 'ACTIVE',


  -- Table Constraints
  CONSTRAINT pk_loans PRIMARY KEY (loan_id),
  CONSTRAINT fk_loans_customers FOREIGN KEY (customer_id) REFERENCES banking.customers (customer_id),
  CONSTRAINT fk_loans_branches FOREIGN KEY (branch_id) REFERENCES banking.branches (branch_id),
  CONSTRAINT chk_loan_amount CHECK (loan_amount > 0),
  CONSTRAINT chk_interest_rate CHECK (interest_rate BETWEEN 0 AND 30),
  CONSTRAINT chk_loan_dates CHECK (end_date > start_date),
  CONSTRAINT chk_loan_type CHECK (loan_type IN ('HOME', 'AUTO', 'PERSONAL', 'BUSINESS')),
  CONSTRAINT chk_loan_status CHECK (loan_status IN ('ACTIVE', 'CLOSED', 'DEFAULTED'))
);

-- ------------------------------------------------------------------------------------
-- DAY 1, TASK 3: Create the loan payments table.
-- ------------------------------------------------------------------------------------
CREATE TABLE banking.loan_payments (
payment_id INT,
loan_id INT,
payment_amount NUMERIC(12,2) NOT NULL,
payment_date DATE NOT NULL,
payment_method VARCHAR(30) NOT NULL,
payment_status VARCHAR(20) DEFAULT 'COMPLETED',

--Table Constraints
  CONSTRAINT pk_loan_payments PRIMARY KEY (payment_id),
  CONSTRAINT fk_payment_loans FOREIGN KEY (loan_id) REFERENCES banking.loans(loan_id),
  CONSTRAINT chk_payment_amount CHECK (payment_amount > 0),
  CONSTRAINT chk_payment_method CHECK (payment_method IN ('CASH','BANK_TRANSFER','CHEQUE','ONLINE')),
  CONSTRAINT chk_payment_status CHECK (payment_status IN ('COMPLETED','PENDING','FAILED'))
);

-- ------------------------------------------------------------------------------------
-- DAY 1, TASK 4: Test Constraints
-- ------------------------------------------------------------------------------------

-- Test 1: an employee with negative salary.
INSERT INTO banking.employees (employee_id, branch_id, full_name, email, job_title, salary, hire_date)
VALUES (99, 1, 'Riya Dhami', 'riya_dhami@mail.com', 'Loan Officer', -60000, '2025-05-14');

-- Test 2: A loan with invalid type
INSERT INTO banking.loans (loan_id,customer_id,branch_id,loan_type,loan_amount,interest_rate,start_date,end_date)
VALUES (99,2,2,'STUDENT',50000.0,5.5,'2026-01-03','2026-05-24');

-- Test 3: Loan for a customer that does not exist.
INSERT INTO banking.loans (loan_id, customer_id, branch_id, loan_type, loan_amount, interest_rate, start_date, end_date)
VALUES (99,999,1,'PERSONAL',10000.00,11.0,'2025-12-05','2026-05-15');

-- Test 4: A loan whose end date is earlier than start date.
INSERT INTO banking.loans (loan_id, customer_id, branch_id, loan_type, loan_amount, interest_rate, start_date, end_date)
VALUES (99,1,1,'PERSONAL',10000.00,11.0,'2026-05-01','2026-01-15');

-- Test 5: A payment with negative payment amount
INSERT INTO banking.loan_payments (payment_id, loan_id, payment_amount, payment_date, payment_method)
VALUES (99,2,-2500.00,'2026-02-19','ONLINE');



