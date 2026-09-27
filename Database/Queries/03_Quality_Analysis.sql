-- =====================================================
-- Project Name:
-- Manufacturing Quality Analytics & Production Intelligence System
--
-- File:
-- 03_Quality_Analysis.sql
--
-- Description:
-- Analyze product quality, inspection performance,
-- defect trends and quality KPIs.
--
-- Author:
-- Afnaan S
-- =====================================================

USE manufacturing_quality_analytics;

-- =====================================================
-- SECTION 1 : QUALITY OVERVIEW
-- =====================================================

-- Q1. Total Quality Inspections

SELECT
    COUNT(*) AS total_quality_checks
FROM quality_check;

--------------------------------------------------------

-- Q2. Average Inspection Score

SELECT
    ROUND(AVG(inspection_score),2) AS average_score
FROM quality_check;

--------------------------------------------------------

-- Q3. Highest Inspection Score

SELECT
    MAX(inspection_score) AS highest_score
FROM quality_check;

--------------------------------------------------------

-- Q4. Lowest Inspection Score

SELECT
    MIN(inspection_score) AS lowest_score
FROM quality_check;

-- =====================================================
-- SECTION 2 : INSPECTION RESULTS
-- =====================================================

-- Q5. Inspection Result Summary

SELECT
    inspection_result,
    COUNT(*) AS total_inspections
FROM quality_check
GROUP BY inspection_result
ORDER BY total_inspections DESC;

--------------------------------------------------------

-- Q6. Pass Percentage

SELECT
    ROUND(
        SUM(CASE
                WHEN inspection_result='Pass'
                THEN 1 ELSE 0
            END)
        *100.0/COUNT(*),
        2
    ) AS pass_percentage
FROM quality_check;

--------------------------------------------------------

-- Q7. Fail Percentage

SELECT
    ROUND(
        SUM(CASE
                WHEN inspection_result='Fail'
                THEN 1 ELSE 0
            END)
        *100.0/COUNT(*),
        2
    ) AS fail_percentage
FROM quality_check;

-- =====================================================
-- SECTION 3 : PRODUCT QUALITY
-- =====================================================

-- Q8. Average Inspection Score by Product

SELECT
    p.product_name,
    ROUND(AVG(q.inspection_score),2) AS average_score
FROM quality_check q
JOIN production_batch pb
ON q.batch_id = pb.batch_id
JOIN product p
ON pb.product_id = p.product_id
GROUP BY p.product_name
ORDER BY average_score DESC;

--------------------------------------------------------

-- Q9. Failed Inspections by Product

SELECT
    p.product_name,
    COUNT(*) AS failed_inspections
FROM quality_check q
JOIN production_batch pb
ON q.batch_id = pb.batch_id
JOIN product p
ON pb.product_id = p.product_id
WHERE q.inspection_result='Fail'
GROUP BY p.product_name
ORDER BY failed_inspections DESC;

-- =====================================================
-- SECTION 4 : MACHINE QUALITY
-- =====================================================

-- Q10. Average Inspection Score by Machine

SELECT
    m.machine_name,
    ROUND(AVG(q.inspection_score),2) AS average_score
FROM quality_check q
JOIN production_batch pb
ON q.batch_id=pb.batch_id
JOIN machine m
ON pb.machine_id=m.machine_id
GROUP BY m.machine_name
ORDER BY average_score DESC;

--------------------------------------------------------

-- Q11. Failed Inspections by Machine

SELECT
    m.machine_name,
    COUNT(*) AS failed_inspections
FROM quality_check q
JOIN production_batch pb
ON q.batch_id=pb.batch_id
JOIN machine m
ON pb.machine_id=m.machine_id
WHERE q.inspection_result='Fail'
GROUP BY m.machine_name
ORDER BY failed_inspections DESC;

-- =====================================================
-- SECTION 5 : OPERATOR QUALITY
-- =====================================================

-- Q12. Average Inspection Score by Operator

SELECT
    o.operator_name,
    ROUND(AVG(q.inspection_score),2) AS average_score
FROM quality_check q
JOIN production_batch pb
ON q.batch_id=pb.batch_id
JOIN operator o
ON pb.operator_id=o.operator_id
GROUP BY o.operator_name
ORDER BY average_score DESC;

--------------------------------------------------------

-- Q13. Failed Inspections by Operator

SELECT
    o.operator_name,
    COUNT(*) AS failed_inspections
FROM quality_check q
JOIN production_batch pb
ON q.batch_id=pb.batch_id
JOIN operator o
ON pb.operator_id=o.operator_id
WHERE q.inspection_result='Fail'
GROUP BY o.operator_name
ORDER BY failed_inspections DESC;

-- =====================================================
-- SECTION 6 : DEFECT ANALYSIS
-- =====================================================

-- Q14. Total Defects

SELECT
    COUNT(*) AS total_defects
FROM defect;

--------------------------------------------------------

-- Q15. Defects by Type

SELECT
    defect_type,
    COUNT(*) AS total_defects
FROM defect
GROUP BY defect_type
ORDER BY total_defects DESC;

--------------------------------------------------------

-- Q16. Defects by Severity

SELECT
    severity,
    COUNT(*) AS total_defects
FROM defect
GROUP BY severity
ORDER BY total_defects DESC;

--------------------------------------------------------

-- Q17. Defect Resolution Status

SELECT
    resolution_status,
    COUNT(*) AS total_defects
FROM defect
GROUP BY resolution_status
ORDER BY total_defects DESC;

-- =====================================================
-- SECTION 7 : PRODUCT DEFECT ANALYSIS
-- =====================================================

-- Q18. Total Defects by Product

SELECT
    p.product_name,
    COUNT(*) AS total_defects
FROM defect d
JOIN production_batch pb
ON d.batch_id=pb.batch_id
JOIN product p
ON pb.product_id=p.product_id
GROUP BY p.product_name
ORDER BY total_defects DESC;

-- =====================================================
-- SECTION 8 : DEFECT TREND
-- =====================================================

-- Q19. Monthly Defect Trend

SELECT
    YEAR(defect_date) AS defect_year,
    MONTH(defect_date) AS defect_month,
    COUNT(*) AS total_defects
FROM defect
GROUP BY
    YEAR(defect_date),
    MONTH(defect_date)
ORDER BY
    defect_year,
    defect_month;

-- =====================================================
-- SECTION 9 : EXECUTIVE QUALITY KPI
-- =====================================================

-- Q20. Quality KPI Summary

SELECT

    (SELECT COUNT(*)
     FROM quality_check)
     AS total_quality_checks,

    (SELECT COUNT(*)
     FROM defect)
     AS total_defects,

    ROUND(
        (SELECT AVG(inspection_score)
         FROM quality_check),
        2
    ) AS average_quality_score,

    ROUND(
        (SELECT SUM(
            CASE
                WHEN inspection_result='Pass'
                THEN 1 ELSE 0
            END
        )*100/COUNT(*)
        FROM quality_check),
        2
    ) AS pass_percentage;