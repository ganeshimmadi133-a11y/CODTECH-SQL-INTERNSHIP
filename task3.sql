-- TASK 03: DATABASE MIGRATION

-- CONNECTION AND SETUP
-- Connecting as system administrator
CONNECT system;

-- 1. Setup Migration Table
CREATE TABLE migration_source (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER
);

INSERT INTO migration_source VALUES (101, 'Sanay Reddy', 75000);
INSERT INTO migration_source VALUES (102, 'Rahul Sharma', 68000);
COMMIT;

-- 2. Export to CSV (The Migration Step)
SET COLSEP ','
SET PAGESIZE 0
SET FEEDBACK OFF
SET TRIMSPOOL ON

SPOOL C:\Users\Public\task3_migration_data.csv
SELECT * FROM migration_source;
SPOOL OFF

-- 3. Integrity Verification
SELECT COUNT(*) AS total_records_migrated FROM migration_source;