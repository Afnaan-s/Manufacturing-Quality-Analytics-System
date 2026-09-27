-- =====================================================
-- Project Name:
-- Manufacturing Quality Analytics & Production Intelligence System
--
-- File:
-- 02_Production_Analysis.sql
--
-- Description:
-- Analyze production performance across plants,
-- departments, products, machines and operators.
--
-- Author:
-- Afnaan S
-- =====================================================

USE manufacturing_quality_analytics;

-- =====================================================
-- SECTION 1 : PRODUCTION OVERVIEW
-- =====================================================

-- Q1. Total Production Quantity

SELECT
    SUM(produced_quantity) AS total_production
FROM production_batch;

--------------------------------------------------------

-- Q2. Total Planned Quantity

SELECT
    SUM(planned_quantity) AS total_planned_production
FROM production_batch;

--------------------------------------------------------

-- Q3. Production Efficiency

SELECT
    ROUND(
        (SUM(produced_quantity) /
        SUM(planned_quantity)) * 100,
        2
    ) AS production_efficiency_percentage
FROM production_batch;

--------------------------------------------------------

-- Q4. Total Production Batches

SELECT
    COUNT(*) AS total_batches
FROM production_batch;

-- =====================================================
-- SECTION 2 : PLANT PERFORMANCE
-- =====================================================

-- Q5. Production by Plant

SELECT
    p.plant_name,
    SUM(pb.produced_quantity) AS total_production
FROM production_batch pb
JOIN machine m
    ON pb.machine_id = m.machine_id
JOIN department d
    ON m.department_id = d.department_id
JOIN plant p
    ON d.plant_id = p.plant_id
GROUP BY
    p.plant_name
ORDER BY
    total_production DESC;

--------------------------------------------------------

-- Q6. Average Batch Production by Plant

SELECT
    p.plant_name,
    ROUND(AVG(pb.produced_quantity),2) AS average_batch_output
FROM production_batch pb
JOIN machine m
    ON pb.machine_id = m.machine_id
JOIN department d
    ON m.department_id = d.department_id
JOIN plant p
    ON d.plant_id = p.plant_id
GROUP BY
    p.plant_name
ORDER BY
    average_batch_output DESC;

-- =====================================================
-- SECTION 3 : DEPARTMENT PERFORMANCE
-- =====================================================

-- Q7. Production by Department

SELECT
    d.department_name,
    SUM(pb.produced_quantity) AS total_production
FROM production_batch pb
JOIN machine m
    ON pb.machine_id = m.machine_id
JOIN department d
    ON m.department_id = d.department_id
GROUP BY
    d.department_name
ORDER BY
    total_production DESC;

--------------------------------------------------------

-- Q8. Average Production by Department

SELECT
    d.department_name,
    ROUND(AVG(pb.produced_quantity),2) AS average_output
FROM production_batch pb
JOIN machine m
    ON pb.machine_id = m.machine_id
JOIN department d
    ON m.department_id = d.department_id
GROUP BY
    d.department_name
ORDER BY
    average_output DESC;

-- =====================================================
-- SECTION 4 : PRODUCT PERFORMANCE
-- =====================================================

-- Q9. Production by Product

SELECT
    p.product_name,
    SUM(pb.produced_quantity) AS total_production
FROM production_batch pb
JOIN product p
    ON pb.product_id = p.product_id
GROUP BY
    p.product_name
ORDER BY
    total_production DESC;

--------------------------------------------------------

-- Q10. Top 10 Products

SELECT
    p.product_name,
    SUM(pb.produced_quantity) AS total_production
FROM production_batch pb
JOIN product p
    ON pb.product_id = p.product_id
GROUP BY
    p.product_name
ORDER BY
    total_production DESC
LIMIT 10;

-- =====================================================
-- SECTION 5 : MACHINE PERFORMANCE
-- =====================================================

-- Q11. Production by Machine

SELECT
    machine_name,
    SUM(produced_quantity) AS total_production
FROM production_batch pb
JOIN machine m
ON pb.machine_id = m.machine_id
GROUP BY machine_name
ORDER BY total_production DESC;

--------------------------------------------------------

-- Q12. Top 10 Machines

SELECT
    machine_name,
    SUM(produced_quantity) AS total_production
FROM production_batch pb
JOIN machine m
ON pb.machine_id = m.machine_id
GROUP BY machine_name
ORDER BY total_production DESC
LIMIT 10;

-- =====================================================
-- SECTION 6 : OPERATOR PERFORMANCE
-- =====================================================

-- Q13. Production by Operator

SELECT
    operator_name,
    SUM(produced_quantity) AS total_production
FROM production_batch pb
JOIN operator o
ON pb.operator_id = o.operator_id
GROUP BY operator_name
ORDER BY total_production DESC;

--------------------------------------------------------

-- Q14. Top 10 Operators

SELECT
    operator_name,
    SUM(produced_quantity) AS total_production
FROM production_batch pb
JOIN operator o
ON pb.operator_id = o.operator_id
GROUP BY operator_name
ORDER BY total_production DESC
LIMIT 10;

-- =====================================================
-- SECTION 7 : PRODUCTION STATUS
-- =====================================================

-- Q15. Batch Status Summary

SELECT
    batch_status,
    COUNT(*) AS total_batches
FROM production_batch
GROUP BY batch_status
ORDER BY total_batches DESC;

--------------------------------------------------------

-- Q16. Planned vs Produced

SELECT
    SUM(planned_quantity) AS planned_quantity,
    SUM(produced_quantity) AS produced_quantity
FROM production_batch;

--------------------------------------------------------

-- Q17. Production Variance

SELECT
    SUM(produced_quantity - planned_quantity)
    AS total_variance
FROM production_batch;

-- =====================================================
-- SECTION 8 : PRODUCTION TREND
-- =====================================================

-- Q18. Daily Production

SELECT
    production_date,
    SUM(produced_quantity) AS total_production
FROM production_batch
GROUP BY production_date
ORDER BY production_date;

--------------------------------------------------------

-- Q19. Monthly Production

SELECT
    YEAR(production_date) AS production_year,
    MONTH(production_date) AS production_month,
    SUM(produced_quantity) AS total_production
FROM production_batch
GROUP BY
    YEAR(production_date),
    MONTH(production_date)
ORDER BY
    production_year,
    production_month;

-- =====================================================
-- SECTION 9 : EXECUTIVE SUMMARY
-- =====================================================

-- Q20. Production KPI Summary

SELECT

    COUNT(*) AS total_batches,

    SUM(planned_quantity) AS planned_quantity,

    SUM(produced_quantity) AS produced_quantity,

    ROUND(
        (SUM(produced_quantity) /
        SUM(planned_quantity))*100,
        2
    ) AS efficiency_percentage

FROM production_batch;