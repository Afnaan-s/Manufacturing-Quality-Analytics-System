-- =====================================================
-- Project Name:
-- Manufacturing Quality Analytics & Production Intelligence System
--
-- File:
-- 06_Supplier_Analysis.sql
--
-- Description:
-- Analyze supplier performance, material supply,
-- supplier distribution and procurement KPIs.
--
-- Author:
-- Afnaan S
-- =====================================================

USE manufacturing_quality_analytics;

-- =====================================================
-- SECTION 1 : SUPPLIER OVERVIEW
-- =====================================================

-- Q1. Total Suppliers

SELECT
    COUNT(*) AS total_suppliers
FROM supplier;

--------------------------------------------------------

-- Q2. Supplier Status Distribution

SELECT
    status,
    COUNT(*) AS total_suppliers
FROM supplier
GROUP BY status
ORDER BY total_suppliers DESC;

--------------------------------------------------------

-- Q3. Suppliers by Location

SELECT
    location,
    COUNT(*) AS total_suppliers
FROM supplier
GROUP BY location
ORDER BY total_suppliers DESC;

--------------------------------------------------------

-- Q4. Suppliers by Material Category

SELECT
    material_category,
    COUNT(*) AS total_suppliers
FROM supplier
GROUP BY material_category
ORDER BY total_suppliers DESC;

--------------------------------------------------------

-- Q5. Active Suppliers

SELECT
    COUNT(*) AS active_suppliers
FROM supplier
WHERE status='Active';

-- =====================================================
-- SECTION 2 : MATERIAL SUPPLY ANALYSIS
-- =====================================================

-- Q6. Materials Supplied by Supplier

SELECT
    s.supplier_name,
    COUNT(rm.material_id) AS total_materials
FROM supplier s
JOIN raw_material rm
ON s.supplier_id = rm.supplier_id
GROUP BY s.supplier_name
ORDER BY total_materials DESC;

--------------------------------------------------------

-- Q7. Average Material Cost by Supplier

SELECT
    s.supplier_name,
    ROUND(AVG(rm.unit_cost),2) AS average_material_cost
FROM supplier s
JOIN raw_material rm
ON s.supplier_id = rm.supplier_id
GROUP BY s.supplier_name
ORDER BY average_material_cost DESC;

--------------------------------------------------------

-- Q8. Total Inventory Value by Supplier

SELECT
    s.supplier_name,
    ROUND(
        SUM(i.available_quantity * rm.unit_cost),
        2
    ) AS inventory_value
FROM supplier s
JOIN raw_material rm
ON s.supplier_id = rm.supplier_id
JOIN inventory i
ON rm.material_id = i.material_id
GROUP BY s.supplier_name
ORDER BY inventory_value DESC;

--------------------------------------------------------

-- Q9. Total Stock Supplied

SELECT
    s.supplier_name,
    SUM(i.available_quantity) AS available_stock
FROM supplier s
JOIN raw_material rm
ON s.supplier_id = rm.supplier_id
JOIN inventory i
ON rm.material_id = i.material_id
GROUP BY s.supplier_name
ORDER BY available_stock DESC;

--------------------------------------------------------

-- Q10. Supplier Material Categories

SELECT
    s.supplier_name,
    rm.material_category,
    COUNT(*) AS materials
FROM supplier s
JOIN raw_material rm
ON s.supplier_id = rm.supplier_id
GROUP BY
    s.supplier_name,
    rm.material_category
ORDER BY
    s.supplier_name;

-- =====================================================
-- SECTION 3 : PROCUREMENT INSIGHTS
-- =====================================================

-- Q11. Highest Cost Suppliers

SELECT
    s.supplier_name,
    ROUND(AVG(rm.unit_cost),2) AS average_cost
FROM supplier s
JOIN raw_material rm
ON s.supplier_id = rm.supplier_id
GROUP BY s.supplier_name
ORDER BY average_cost DESC
LIMIT 10;

--------------------------------------------------------

-- Q12. Lowest Cost Suppliers

SELECT
    s.supplier_name,
    ROUND(AVG(rm.unit_cost),2) AS average_cost
FROM supplier s
JOIN raw_material rm
ON s.supplier_id = rm.supplier_id
GROUP BY s.supplier_name
ORDER BY average_cost
LIMIT 10;

--------------------------------------------------------

-- Q13. Materials by Unit

SELECT
    unit,
    COUNT(*) AS total_materials
FROM raw_material
GROUP BY unit
ORDER BY total_materials DESC;

--------------------------------------------------------

-- Q14. Average Reorder Level by Category

SELECT
    material_category,
    ROUND(AVG(reorder_level),2) AS average_reorder_level
FROM raw_material
GROUP BY material_category
ORDER BY average_reorder_level DESC;

--------------------------------------------------------

-- Q15. Most Expensive Materials

SELECT
    material_name,
    unit_cost
FROM raw_material
ORDER BY unit_cost DESC
LIMIT 10;

-- =====================================================
-- SECTION 4 : EXECUTIVE SUPPLIER KPI
-- =====================================================

-- Q16. Supplier KPI Summary

SELECT

    (SELECT COUNT(*)
     FROM supplier)
     AS total_suppliers,

    (SELECT COUNT(*)
     FROM raw_material)
     AS total_materials,

    (SELECT COUNT(*)
     FROM inventory)
     AS inventory_records,

    (
        SELECT ROUND(
            SUM(i.available_quantity * rm.unit_cost),
            2
        )
        FROM inventory i
        JOIN raw_material rm
        ON i.material_id = rm.material_id
    ) AS inventory_value;

--------------------------------------------------------

-- Q17. Top 10 Suppliers by Inventory Value

SELECT
    s.supplier_name,
    ROUND(
        SUM(i.available_quantity * rm.unit_cost),
        2
    ) AS inventory_value
FROM supplier s
JOIN raw_material rm
ON s.supplier_id = rm.supplier_id
JOIN inventory i
ON rm.material_id = i.material_id
GROUP BY s.supplier_name
ORDER BY inventory_value DESC
LIMIT 10;

--------------------------------------------------------

-- Q18. Supplier Distribution

SELECT
    location,
    COUNT(*) AS suppliers
FROM supplier
GROUP BY location
ORDER BY suppliers DESC;

--------------------------------------------------------

-- Q19. Material Distribution

SELECT
    material_category,
    COUNT(*) AS materials
FROM raw_material
GROUP BY material_category
ORDER BY materials DESC;

--------------------------------------------------------

-- Q20. Executive Supplier Dashboard Summary

SELECT
    COUNT(*) AS suppliers,
    COUNT(DISTINCT location) AS locations,
    COUNT(DISTINCT material_category) AS categories
FROM supplier;

describe shift;