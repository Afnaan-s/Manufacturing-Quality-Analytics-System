-- =====================================================
-- Project Name:
-- Manufacturing Quality Analytics & Production Intelligence System
--
-- File:
-- 05_Inventory_Analysis.sql
--
-- Description:
-- Analyze inventory levels, material consumption,
-- stock availability and supplier contribution.
--
-- Author:
-- Afnaan S
-- =====================================================

USE manufacturing_quality_analytics;

-- =====================================================
-- SECTION 1 : INVENTORY OVERVIEW
-- =====================================================

-- Q1. Total Inventory Records

SELECT
    COUNT(*) AS total_inventory_records
FROM inventory;

--------------------------------------------------------

-- Q2. Total Available Quantity

SELECT
    SUM(available_quantity) AS total_available_quantity
FROM inventory;

--------------------------------------------------------

-- Q3. Average Available Quantity

SELECT
    ROUND(AVG(available_quantity),2) AS average_available_quantity
FROM inventory;

--------------------------------------------------------

-- Q4. Total Inventory Value

SELECT
    ROUND(
        SUM(i.available_quantity * rm.unit_cost),
        2
    ) AS total_inventory_value
FROM inventory i
JOIN raw_material rm
ON i.material_id = rm.material_id;

--------------------------------------------------------

-- Q5. Average Material Cost

SELECT
    ROUND(AVG(unit_cost),2) AS average_material_cost
FROM raw_material;

-- =====================================================
-- SECTION 2 : INVENTORY STATUS
-- =====================================================

-- Q6. Materials Below Minimum Stock Level

SELECT
    rm.material_name,
    i.available_quantity,
    i.minimum_stock_level
FROM inventory i
JOIN raw_material rm
ON i.material_id = rm.material_id
WHERE i.available_quantity < i.minimum_stock_level
ORDER BY i.available_quantity;

--------------------------------------------------------

-- Q7. Materials Above Minimum Stock Level

SELECT
    rm.material_name,
    i.available_quantity,
    i.minimum_stock_level
FROM inventory i
JOIN raw_material rm
ON i.material_id = rm.material_id
WHERE i.available_quantity >= i.minimum_stock_level
ORDER BY i.available_quantity DESC;

--------------------------------------------------------

-- Q8. Inventory by Warehouse

SELECT
    warehouse_location,
    COUNT(*) AS total_materials,
    SUM(available_quantity) AS total_quantity
FROM inventory
GROUP BY warehouse_location
ORDER BY total_quantity DESC;

--------------------------------------------------------

-- Q9. Top 10 Materials by Available Quantity

SELECT
    rm.material_name,
    i.available_quantity
FROM inventory i
JOIN raw_material rm
ON i.material_id = rm.material_id
ORDER BY i.available_quantity DESC
LIMIT 10;

--------------------------------------------------------

-- Q10. Bottom 10 Materials by Available Quantity

SELECT
    rm.material_name,
    i.available_quantity
FROM inventory i
JOIN raw_material rm
ON i.material_id = rm.material_id
ORDER BY i.available_quantity
LIMIT 10;

-- =====================================================
-- SECTION 3 : MATERIAL & SUPPLIER ANALYSIS
-- =====================================================

-- Q11. Materials by Category

SELECT
    material_category,
    COUNT(*) AS total_materials
FROM raw_material
GROUP BY material_category
ORDER BY total_materials DESC;

--------------------------------------------------------

-- Q12. Average Unit Cost by Material Category

SELECT
    material_category,
    ROUND(AVG(unit_cost),2) AS average_unit_cost
FROM raw_material
GROUP BY material_category
ORDER BY average_unit_cost DESC;

--------------------------------------------------------

-- Q13. Total Materials by Supplier

SELECT
    s.supplier_name,
    COUNT(rm.material_id) AS total_materials
FROM supplier s
JOIN raw_material rm
ON s.supplier_id = rm.supplier_id
GROUP BY s.supplier_name
ORDER BY total_materials DESC;

--------------------------------------------------------

-- Q14. Inventory Value by Supplier

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

-- Q15. Top 10 Highest Value Materials

SELECT
    rm.material_name,
    ROUND(
        i.available_quantity * rm.unit_cost,
        2
    ) AS inventory_value
FROM inventory i
JOIN raw_material rm
ON i.material_id = rm.material_id
ORDER BY inventory_value DESC
LIMIT 10;
-- =====================================================
-- SECTION 4 : MATERIAL USAGE ANALYSIS
-- =====================================================

-- Q16. Total Material Consumption

SELECT
    SUM(quantity_used) AS total_material_consumption
FROM material_usage;

--------------------------------------------------------

-- Q17. Material Consumption by Material

SELECT
    rm.material_name,
    SUM(mu.quantity_used) AS total_consumption
FROM material_usage mu
JOIN raw_material rm
ON mu.material_id = rm.material_id
GROUP BY rm.material_name
ORDER BY total_consumption DESC;

--------------------------------------------------------

-- Q18. Top 10 Most Consumed Materials

SELECT
    rm.material_name,
    SUM(mu.quantity_used) AS total_consumption
FROM material_usage mu
JOIN raw_material rm
ON mu.material_id = rm.material_id
GROUP BY rm.material_name
ORDER BY total_consumption DESC
LIMIT 10;

--------------------------------------------------------

-- Q19. Material Consumption by Product

SELECT
    p.product_name,
    SUM(mu.quantity_used) AS total_material_used
FROM material_usage mu
JOIN production_batch pb
ON mu.batch_id = pb.batch_id
JOIN product p
ON pb.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_material_used DESC;

--------------------------------------------------------

-- Q20. Average Material Consumption Per Batch

SELECT
    ROUND(AVG(quantity_used),2) AS average_material_usage
FROM material_usage;

-- =====================================================
-- SECTION 5 : INVENTORY PERFORMANCE
-- =====================================================

-- Q21. Total Inventory Value by Material Category

SELECT
    rm.material_category,
    ROUND(
        SUM(i.available_quantity * rm.unit_cost),
        2
    ) AS inventory_value
FROM inventory i
JOIN raw_material rm
ON i.material_id = rm.material_id
GROUP BY rm.material_category
ORDER BY inventory_value DESC;

--------------------------------------------------------

-- Q22. Warehouse-wise Inventory Value

SELECT
    i.warehouse_location,
    ROUND(
        SUM(i.available_quantity * rm.unit_cost),
        2
    ) AS inventory_value
FROM inventory i
JOIN raw_material rm
ON i.material_id = rm.material_id
GROUP BY i.warehouse_location
ORDER BY inventory_value DESC;

--------------------------------------------------------

-- Q23. Average Stock Level by Warehouse

SELECT
    warehouse_location,
    ROUND(AVG(available_quantity),2) AS average_stock
FROM inventory
GROUP BY warehouse_location
ORDER BY average_stock DESC;

--------------------------------------------------------

-- Q24. Materials with Highest Unit Cost

SELECT
    material_name,
    unit_cost
FROM raw_material
ORDER BY unit_cost DESC
LIMIT 10;

--------------------------------------------------------

-- Q25. Materials with Lowest Unit Cost

SELECT
    material_name,
    unit_cost
FROM raw_material
ORDER BY unit_cost
LIMIT 10;

-- =====================================================
-- SECTION 6 : EXECUTIVE INVENTORY KPI
-- =====================================================

-- Q26. Inventory KPI Summary

SELECT

    (SELECT COUNT(*) FROM inventory)
    AS total_inventory_records,

    (SELECT COUNT(*) FROM raw_material)
    AS total_materials,

    (SELECT COUNT(*) FROM supplier)
    AS total_suppliers,

    (SELECT SUM(available_quantity)
     FROM inventory)
    AS total_available_quantity,

    (
        SELECT ROUND(
            SUM(i.available_quantity * rm.unit_cost),
            2
        )
        FROM inventory i
        JOIN raw_material rm
        ON i.material_id = rm.material_id
    ) AS total_inventory_value;

--------------------------------------------------------

-- Q27. Warehouse Summary

SELECT
    warehouse_location,
    COUNT(*) AS materials_stored,
    SUM(available_quantity) AS total_stock
FROM inventory
GROUP BY warehouse_location
ORDER BY total_stock DESC;

--------------------------------------------------------

-- Q28. Supplier Material Distribution

SELECT
    s.supplier_name,
    rm.material_category,
    COUNT(*) AS material_count
FROM supplier s
JOIN raw_material rm
ON s.supplier_id = rm.supplier_id
GROUP BY
    s.supplier_name,
    rm.material_category
ORDER BY
    s.supplier_name,
    material_count DESC;

--------------------------------------------------------

-- Q29. Material Availability Status

SELECT
    CASE
        WHEN available_quantity < minimum_stock_level
        THEN 'Low Stock'
        ELSE 'Sufficient Stock'
    END AS inventory_status,
    COUNT(*) AS total_materials
FROM inventory
GROUP BY inventory_status;

--------------------------------------------------------

-- Q30. Executive Inventory Dashboard Summary

SELECT
    COUNT(*) AS inventory_records,
    SUM(available_quantity) AS total_stock,
    ROUND(AVG(available_quantity),2) AS average_stock,
    MIN(available_quantity) AS minimum_stock,
    MAX(available_quantity) AS maximum_stock
FROM inventory;