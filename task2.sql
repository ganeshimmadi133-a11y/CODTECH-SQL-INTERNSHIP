-- TASK 02: ADVANCED DATA ANALYSIS


-- 1. Setup Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    emp_id INT,
    amount INT,
    sale_date DATE
);

INSERT INTO Sales VALUES (1, 1, 5000, TO_DATE('2024-01-01', 'YYYY-MM-DD'));
INSERT INTO Sales VALUES (2, 1, 7000, TO_DATE('2024-01-05', 'YYYY-MM-DD'));
INSERT INTO Sales VALUES (3, 2, 6000, TO_DATE('2024-01-03', 'YYYY-MM-DD'));
INSERT INTO Sales VALUES (4, 2, 9000, TO_DATE('2024-01-10', 'YYYY-MM-DD'));
COMMIT;

-- 2. Window Function (Ranking)
SELECT emp_id, amount, RANK() OVER (PARTITION BY emp_id ORDER BY amount DESC) AS sale_rank FROM Sales;

-- 3. Subquery (Filtering by Average)
SELECT emp_id, amount FROM Sales WHERE amount > (SELECT AVG(amount) FROM Sales);

-- 4. CTE (Total Sales per Employee)
WITH TotalSales AS (
    SELECT emp_id, SUM(amount) AS total_amount
    FROM Sales
    GROUP BY emp_id
)
SELECT * FROM TotalSales;