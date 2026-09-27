-- =====================================================
-- Project Name:
-- Manufacturing Quality Analytics & Production Intelligence System
--
-- File:
-- 01_Data_Exploration.sql
--
-- Description:
-- Initial data exploration, validation and profiling
-- of the Manufacturing Quality Analytics database.
--
-- Author:
-- Afnaan S
-- =====================================================

USE manufacturing_quality_analytics;

-- =====================================================
-- SECTION 1 : DATABASE OVERVIEW
-- =====================================================

-- Q1. Display all tables

SHOW TABLES;

-- Q2. Plant table structure

DESCRIBE plant;

-- Q3. Department table structure

DESCRIBE department;

-- Q4. Machine table structure

DESCRIBE machine;

-- Q5. Product table structure

DESCRIBE product;

-- Q6. Production Batch table structure

DESCRIBE production_batch;

-- =====================================================
-- SECTION 2 : DATA VOLUME
-- =====================================================

-- Q7. Number of Plants

SELECT
COUNT(*) AS total_plants
FROM plant;

-- Q8. Number of Departments

SELECT
COUNT(*) AS total_departments
FROM department;

-- Q9. Number of Machines

SELECT
COUNT(*) AS total_machines
FROM machine;

-- Q10. Number of Operators

SELECT
COUNT(*) AS total_operators
FROM operator;

-- Q11. Number of Products

SELECT
COUNT(*) AS total_products
FROM product;

-- Q12. Number of Suppliers

SELECT
COUNT(*) AS total_suppliers
FROM supplier;

-- Q13. Number of Raw Materials

SELECT
COUNT(*) AS total_raw_materials
FROM raw_material;

-- Q14. Number of Production Batches

SELECT
COUNT(*) AS total_batches
FROM production_batch;

-- =====================================================
-- SECTION 3 : MASTER DATA PROFILE
-- =====================================================

-- Q15. Plant Information

SELECT
plant_name,
location,
status
FROM plant
ORDER BY plant_name;

-- Q16. Departments by Plant

SELECT
p.plant_name,
d.department_name
FROM department d
JOIN plant p
ON d.plant_id = p.plant_id
ORDER BY
p.plant_name,
d.department_name;

-- Q17. Machines by Department

SELECT
d.department_name,
COUNT(*) AS total_machines
FROM machine m
JOIN department d
ON m.department_id=d.department_id
GROUP BY d.department_name
ORDER BY total_machines DESC;

-- Q18. Operators by Department

SELECT
d.department_name,
COUNT(*) AS total_operators
FROM operator o
JOIN department d
ON o.department_id=d.department_id
GROUP BY d.department_name
ORDER BY total_operators DESC;

-- Q19. Operators by Shift

SELECT
s.shift_name,
COUNT(*) AS total_operators
FROM operator o
JOIN shift s
ON o.shift_id=s.shift_id
GROUP BY s.shift_name
ORDER BY total_operators DESC;

-- =====================================================
-- SECTION 4 : PRODUCT PROFILE
-- =====================================================

-- Q20. Products by Category

SELECT
category,
COUNT(*) AS total_products
FROM product
GROUP BY category
ORDER BY total_products DESC;

-- Q21. Active Products

SELECT
COUNT(*) AS active_products
FROM product
WHERE status='Active';

-- Q22. Product Price Statistics

SELECT
MIN(unit_price) AS minimum_price,
MAX(unit_price) AS maximum_price,
ROUND(AVG(unit_price),2) AS average_price
FROM product;

-- =====================================================
-- SECTION 5 : MACHINE PROFILE
-- =====================================================

-- Q23. Machine Status Distribution

SELECT
operating_status,
COUNT(*) AS total_machines
FROM machine
GROUP BY operating_status;

-- Q24. Machine Types

SELECT
machine_type,
COUNT(*) AS total_machines
FROM machine
GROUP BY machine_type
ORDER BY total_machines DESC;

-- =====================================================
-- SECTION 6 : PRODUCTION PROFILE
-- =====================================================

-- Q25. Production Date Range

SELECT
MIN(production_date) AS first_production_date,
MAX(production_date) AS last_production_date
FROM production_batch;

-- Q26. Batch Status Distribution

SELECT
batch_status,
COUNT(*) AS total_batches
FROM production_batch
GROUP BY batch_status;

-- =====================================================
-- SECTION 7 : QUALITY PROFILE
-- =====================================================

-- Q27. Inspection Result Distribution

SELECT
inspection_result,
COUNT(*) AS total_inspections
FROM quality_check
GROUP BY inspection_result;

-- Q28. Average Inspection Score

SELECT
ROUND(AVG(inspection_score),2) AS average_score
FROM quality_check;

-- =====================================================
-- SECTION 8 : DEFECT PROFILE
-- =====================================================

-- Q29. Defect Types

SELECT
defect_type,
COUNT(*) AS total_defects
FROM defect
GROUP BY defect_type
ORDER BY total_defects DESC;

-- Q30. Defect Severity

SELECT
severity,
COUNT(*) AS total_defects
FROM defect
GROUP BY severity
ORDER BY total_defects DESC;

-- =====================================================
-- SECTION 9 : MAINTENANCE PROFILE
-- =====================================================

-- Q31. Maintenance Types

SELECT
maintenance_type,
COUNT(*) AS total_maintenance
FROM maintenance
GROUP BY maintenance_type;

-- Q32. Maintenance Status

SELECT
status,
COUNT(*) AS total_records
FROM maintenance
GROUP BY status;

-- =====================================================
-- SECTION 10 : DATA VALIDATION
-- =====================================================

-- Q33. Products without Production

SELECT
p.product_name
FROM product p
LEFT JOIN production_batch pb
ON p.product_id=pb.product_id
WHERE pb.batch_id IS NULL;

-- Q34. Machines without Production

SELECT
m.machine_name
FROM machine m
LEFT JOIN production_batch pb
ON m.machine_id=pb.machine_id
WHERE pb.batch_id IS NULL;

-- Q35. Operators without Production

SELECT
o.operator_name
FROM operator o
LEFT JOIN production_batch pb
ON o.operator_id=pb.operator_id
WHERE pb.batch_id IS NULL;

-- =====================================================
-- SECTION 11 : SAMPLE DATA
-- =====================================================

-- Q36. Sample Production Batches

SELECT *
FROM production_batch
LIMIT 10;

-- Q37. Sample Quality Checks

SELECT *
FROM quality_check
LIMIT 10;

-- Q38. Sample Defects

SELECT *
FROM defect
LIMIT 10;

-- Q39. Sample Maintenance Records

SELECT *
FROM maintenance
LIMIT 10;

-- Q40. Sample Material Usage

SELECT *
FROM material_usage
LIMIT 10;