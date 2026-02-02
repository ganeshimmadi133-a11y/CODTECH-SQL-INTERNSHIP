-- TASK 04: BACKUP AND RECOVERY

-- CONNECTION AND SETUP
-- Connecting as system administrator
CONNECT system;

-- 1. Create Data
CREATE TABLE backup_demo (id INT, info VARCHAR2(50));
INSERT INTO backup_demo VALUES (1, 'Critical Internship Data');
COMMIT;

-- 2. Backup (Save Action)
CREATE TABLE backup_demo_final AS SELECT * FROM backup_demo;

-- 3. Failure (Delete Action)
DROP TABLE backup_demo;

-- 4. Recovery (Restore Action)
CREATE TABLE backup_demo AS SELECT * FROM backup_demo_final;

-- 5. Verification
SELECT * FROM backup_demo;