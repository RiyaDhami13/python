-- =================================================================================
-- DAY 2 : Assignment : Data Insertion and Data Modification
-- Target Schema: Banking
-- ==================================================================================

-- ---------------------------------------------------------------------------------
-- Day 2, Task 1: Insert Employees
-- Requirements are: At least 8 employees, 3 branches, 1 branch with no staff, at least 3 job titles, and at least 1 inactive employees.
-- ----------------------------------------------------------------------------------
TRUNCATE TABLE banking.employees CASCADE;
INSERT INTO banking.employees (employee_id, branch_id, full_name, email, job_title, salary, hire_date, is_active)
VALUES
(1,1,'Riya Dhami','riya@banking.com', 'Data Analyst',85000.00,'2025-05-13',TRUE),
(2,1, 'Shreesha Saud','shreesha@banking.com','Branch Manager',100000.00,'2024-09-23',TRUE),
(3,1,'Neha Pant','neha_pant@banking.com','Customer Service Officer',45000.00,'2025-08-16', TRUE),
(4,2,'Birendra Bhatta','biren@banking.com','Branch Manager',92000.00,'2025-12-09',TRUE),
(5,2,'Ashika Bist','ashika@banking.com','Loan Officer', 60000.00,'2025-01-11',TRUE),
(6,2,'Ratan Chand','ratana@banking.com','Custom Service Officer',75000.00,'2024-09-06', FALSE),   --Inactive employee
(7,3,'Deepika Lekhak','deepika@banking.com','Accountant',65000.00,'2024-11-23', TRUE),
(8,3,'Isha Bista','isha@banking.com','Loan Officer',64000.00,'2025-03-17',TRUE);

-- ----------------------------------------------------------------------------------
-- Day2, Task 2: Insert Loans
-- Requirements: at least 8 loans, 3 branches, 2 customers with multiple loans, 1 customer with no loans ,active,closed, and defaulted loan and 1 loan with no payments
-- ----------------------------------------------------------------------------------
TRUNCATE TABLE banking.loans CASCADE;
INSERT INTO banking.loans (loan_id,customer_id,branch_id,loan_type, loan_amount,interest_rate,start_date,end_date,loan_status)
VALUES 
(101,1,1,'HOME',1200000.00,7.5,'2025-02-05','2034-03-06','ACTIVE'),
(102,2,2,'AUTO',350000.00,10.25,'2024-06-19','2029-09-30','CLOSED'),
(103,2,1,'BUSINESS',2500000.00,12.00,'2025-04-25','2030-03-10','ACTIVE'),
(104,3,2,'PERSONAL',150000.00,14.50,'2025-06-10','2026-06-11', 'DEFAULTED'),
(105,3,2,'HOME',800000.00,9.00,'2025-09-19','2032-05-12','ACTIVE'),
(106,4,2 ,'AUTO',450000.00,11.00,'2025-02-10','2028-05-09','CLOSED'),
(107,5,3,'PERSONAL',200000.00,13.00,'2024-01-05','2025-01-05','CLOSED'),
(108,6,3,'BUSINESS',300000.00,11.50,'2026-01-19','2031-01-19','ACTIVE');

-- ----------------------------------------------------------------------------------
-- Day 2 Task 3: Insert Loan Payments
-- Requirements: At least 15 payments included, iclude completed, pending and failed states.
-- different payment methods, and at least 1 loan with multiple payments.
-- ----------------------------------------------------------------------------------
TRUNCATE TABLE banking.loan_payments CASCADE;
INSERT INTO banking.loan_payments (payment_id, loan_id, payment_amount, payment_date, payment_method, payment_status)
VALUES 
(501, 101, 25000.00, '2025-02-10', 'BANK_TRANSFER', 'COMPLETED'),
(502, 101, 25000.00, '2025-03-10', 'BANK_TRANSFER', 'COMPLETED'), 
(503, 102, 15000.00, '2024-06-15', 'ONLINE', 'COMPLETED'),
(504, 102, 335000.00, '2025-05-10', 'CHEQUE', 'COMPLETED'),       
(505, 103, 75000.00, '2025-04-01', 'ONLINE', 'COMPLETED'),
(506, 103, 75000.00, '2025-05-01', 'ONLINE', 'COMPLETED'),
(507, 103, 75000.00, '2025-06-01', 'ONLINE', 'PENDING'),          
(508, 104, 15000.00, '2025-07-20', 'CASH', 'COMPLETED'),
(509, 104, 15000.00, '2025-08-20', 'CASH', 'FAILED'),           
(510, 105, 30000.00, '2025-10-15', 'BANK_TRANSFER', 'COMPLETED'),
(511, 105, 30000.00, '2025-11-15', 'BANK_TRANSFER', 'COMPLETED'),
(512, 106, 20000.00, '2025-03-10', 'ONLINE', 'COMPLETED'),
(513, 106, 20000.00, '2025-04-10', 'ONLINE', 'COMPLETED'),
(514, 107, 213000.00, '2025-01-03', 'CHEQUE', 'COMPLETED'),
(515, 101, 25000.00, '2025-04-10', 'BANK_TRANSFER', 'COMPLETED');

-- --------------------------------------------------------------------
-- Day 2, Task 4: ALTER TABLE Operations
-- --------------------------------------------------------------------
-- Add phone_number column
ALTER TABLE banking.employees ADD COLUMN phone_number VARCHAR(20);

-- Rename it to contact_number
ALTER TABLE banking.employees RENAME COLUMN phone_number TO contact_number;

-- Increase its maximum character capacity length
ALTER TABLE banking.employees ALTER COLUMN contact_number TYPE VARCHAR(30);

-- Create a temporary metadata notes table
CREATE TABLE banking.loan_notes_temp (
    note_id INT PRIMARY KEY,
    loan_remarks TEXT,
    logged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Drop the temporary table structure completely
DROP TABLE banking.loan_notes_temp;

-- --------------------------------------------------------------------
-- Day 2, Task 5: Safe UPDATE Operations
-- Rule: Run a targeted SELECT verifying the matching WHERE row before altering.
-- --------------------------------------------------------------------
-- Update 1: Increase employee #3's salary by 10%
SELECT * FROM banking.employees WHERE employee_id = 3;
UPDATE banking.employees SET salary = salary * 1.10 WHERE employee_id = 3;

-- Update 2: Mark employee #5 as inactive
SELECT * FROM banking.employees WHERE employee_id = 5;
UPDATE banking.employees SET is_active = FALSE WHERE employee_id = 5;

-- Update 3: Change active loan #106 to closed
SELECT * FROM banking.loans WHERE loan_id = 106;
UPDATE banking.loans SET loan_status = 'CLOSED' WHERE loan_id = 106;

-- Update 4: Change pending payment #507 to completed
SELECT * FROM banking.loan_payments WHERE payment_id = 507;
UPDATE banking.loan_payments SET payment_status = 'COMPLETED' WHERE payment_id = 507;

-- --------------------------------------------------------------------
-- Day 2, Task 6: Safe DELETE Operations
-- --------------------------------------------------------------------
-- Insert a temporary payment row
INSERT INTO banking.loan_payments (payment_id, loan_id, payment_amount, payment_date, payment_method, payment_status)
VALUES (999, 101, 10.00, '2026-01-01', 'CASH', 'FAILED');

-- Verify the record exists
SELECT * FROM banking.loan_payments WHERE payment_id = 999;

-- Delete the record safely using its exact primary key location
DELETE FROM banking.loan_payments WHERE payment_id = 999;

-- Re-verify it has been removed from the dataset
SELECT * FROM banking.loan_payments WHERE payment_id = 999;
