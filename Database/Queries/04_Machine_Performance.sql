-- =====================================================
-- Project Name:
-- Manufacturing Quality Analytics & Production Intelligence System
--
-- File:
-- 04_Machine_Performance.sql
--
-- Description:
-- Analyze machine production, maintenance,
-- downtime and operational performance.
--
-- Author:
-- Afnaan S
-- =====================================================

USE manufacturing_quality_analytics;

-- =====================================================
-- SECTION 1 : MACHINE OVERVIEW
-- =====================================================

-- Q1. Total Machines

SELECT
    COUNT(*) AS total_machines
FROM machine;

--------------------------------------------------------

-- Q2. Machine Status Distribution

SELECT
    operating_status,
    COUNT(*) AS total_machines
FROM machine
GROUP BY operating_status
ORDER BY total_machines DESC;

--------------------------------------------------------

-- Q3. Machine Type Distribution

SELECT
    machine_type,
    COUNT(*) AS total_machines
FROM machine
GROUP BY machine_type
ORDER BY total_machines DESC;

-- =====================================================
-- SECTION 2 : PRODUCTION PERFORMANCE
-- =====================================================

-- Q4. Production Quantity by Machine

SELECT
    m.machine_name,
    SUM(pb.produced_quantity) AS total_production
FROM production_batch pb
JOIN machine m
ON pb.machine_id = m.machine_id
GROUP BY m.machine_name
ORDER BY total_production DESC;

--------------------------------------------------------

-- Q5. Average Production per Batch

SELECT
    m.machine_name,
    ROUND(AVG(pb.produced_quantity),2) AS average_batch_output
FROM production_batch pb
JOIN machine m
ON pb.machine_id = m.machine_id
GROUP BY m.machine_name
ORDER BY average_batch_output DESC;

--------------------------------------------------------

-- Q6. Number of Production Batches by Machine

SELECT
    m.machine_name,
    COUNT(pb.batch_id) AS total_batches
FROM machine m
LEFT JOIN production_batch pb
ON m.machine_id = pb.machine_id
GROUP BY m.machine_name
ORDER BY total_batches DESC;

-- =====================================================
-- SECTION 3 : MAINTENANCE ANALYSIS
-- =====================================================

-- Q7. Total Maintenance Records

SELECT
    COUNT(*) AS total_maintenance_records
FROM maintenance;

--------------------------------------------------------

-- Q8. Maintenance Type Distribution

SELECT
    maintenance_type,
    COUNT(*) AS total_records
FROM maintenance
GROUP BY maintenance_type
ORDER BY total_records DESC;

--------------------------------------------------------

-- Q9. Maintenance Status

SELECT
    status,
    COUNT(*) AS total_records
FROM maintenance
GROUP BY status
ORDER BY total_records DESC;

--------------------------------------------------------

-- Q10. Maintenance Cost by Machine

SELECT
    m.machine_name,
    ROUND(SUM(mt.maintenance_cost),2) AS total_maintenance_cost
FROM maintenance mt
JOIN machine m
ON mt.machine_id = m.machine_id
GROUP BY m.machine_name
ORDER BY total_maintenance_cost DESC;

--------------------------------------------------------

-- Q11. Average Maintenance Cost

SELECT
    ROUND(AVG(maintenance_cost),2) AS average_maintenance_cost
FROM maintenance;

-- =====================================================
-- SECTION 4 : DOWNTIME ANALYSIS
-- =====================================================

-- Q12. Total Downtime

SELECT
    SUM(downtime_minutes) AS total_downtime_minutes
FROM machine_downtime;

--------------------------------------------------------

-- Q13. Average Downtime

SELECT
    ROUND(AVG(downtime_minutes),2) AS average_downtime_minutes
FROM machine_downtime;

--------------------------------------------------------

-- Q14. Downtime by Machine

SELECT
    m.machine_name,
    SUM(md.downtime_minutes) AS total_downtime
FROM machine_downtime md
JOIN machine m
ON md.machine_id = m.machine_id
GROUP BY m.machine_name
ORDER BY total_downtime DESC;

--------------------------------------------------------

-- Q15. Downtime Reasons

SELECT
    reason,
    COUNT(*) AS total_occurrences
FROM machine_downtime
GROUP BY reason
ORDER BY total_occurrences DESC;

--------------------------------------------------------

-- Q16. Downtime Resolution Status

SELECT
    resolved,
    COUNT(*) AS total_records
FROM machine_downtime
GROUP BY resolved;

-- =====================================================
-- SECTION 5 : MACHINE RELIABILITY
-- =====================================================

-- Q17. Maintenance Frequency by Machine

SELECT
    m.machine_name,
    COUNT(mt.maintenance_id) AS maintenance_count
FROM machine m
LEFT JOIN maintenance mt
ON m.machine_id = mt.machine_id
GROUP BY m.machine_name
ORDER BY maintenance_count DESC;

--------------------------------------------------------

-- Q18. Downtime Frequency by Machine

SELECT
    m.machine_name,
    COUNT(md.downtime_id) AS downtime_events
FROM machine m
LEFT JOIN machine_downtime md
ON m.machine_id = md.machine_id
GROUP BY m.machine_name
ORDER BY downtime_events DESC;

--------------------------------------------------------

-- Q19. Production vs Downtime

SELECT
    m.machine_name,
    SUM(pb.produced_quantity) AS total_production,
    COALESCE(SUM(md.downtime_minutes),0) AS total_downtime
FROM machine m
LEFT JOIN production_batch pb
ON m.machine_id = pb.machine_id
LEFT JOIN machine_downtime md
ON m.machine_id = md.machine_id
GROUP BY m.machine_name
ORDER BY total_production DESC;

-- =====================================================
-- SECTION 6 : EXECUTIVE MACHINE KPI
-- =====================================================

-- Q20. Machine Performance Summary

SELECT

    (SELECT COUNT(*) FROM machine)
    AS total_machines,

    (SELECT COUNT(*) FROM maintenance)
    AS maintenance_records,

    (SELECT SUM(downtime_minutes)
     FROM machine_downtime)
    AS total_downtime_minutes,

    (SELECT ROUND(AVG(maintenance_cost),2)
     FROM maintenance)
    AS average_maintenance_cost;