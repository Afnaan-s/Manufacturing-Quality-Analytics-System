-- =====================================================
-- Project Name:
-- Manufacturing Quality Analytics & Production Intelligence System
--
-- File:
-- 03_Load_Data.sql
--
-- Purpose:
-- Loads all CSV files into MySQL tables.
-- =====================================================

USE manufacturing_quality_analytics;

SET FOREIGN_KEY_CHECKS = 0;

-- =====================================================
-- MASTER TABLES
-- =====================================================

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Manufacturing_Quality_Analytics/plant.csv'
INTO TABLE plant
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Manufacturing_Quality_Analytics/shift.csv'
INTO TABLE shift
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Manufacturing_Quality_Analytics/supplier.csv'
INTO TABLE supplier
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Manufacturing_Quality_Analytics/product.csv'
INTO TABLE product
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Manufacturing_Quality_Analytics/department.csv'
INTO TABLE department
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Manufacturing_Quality_Analytics/raw_material.csv'
INTO TABLE raw_material
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Manufacturing_Quality_Analytics/operator.csv'
INTO TABLE operator
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Manufacturing_Quality_Analytics/machine.csv'
INTO TABLE machine
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- =====================================================
-- TRANSACTION TABLES
-- =====================================================

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Manufacturing_Quality_Analytics/inventory.csv'
INTO TABLE inventory
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Manufacturing_Quality_Analytics/production_batch.csv'
INTO TABLE production_batch
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Manufacturing_Quality_Analytics/quality_check.csv'
INTO TABLE quality_check
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Manufacturing_Quality_Analytics/defect.csv'
INTO TABLE defect
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Manufacturing_Quality_Analytics/maintenance.csv'
INTO TABLE maintenance
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Manufacturing_Quality_Analytics/downtime.csv'
INTO TABLE machine_downtime
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Manufacturing_Quality_Analytics/material_usage.csv'
INTO TABLE material_usage
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Manufacturing_Quality_Analytics/production_target.csv'
INTO TABLE production_target
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SET FOREIGN_KEY_CHECKS = 1;

-- =====================================================
-- Verify Data Load
-- =====================================================

SELECT 'plant' AS table_name, COUNT(*) AS total_rows FROM plant
UNION ALL
SELECT 'shift', COUNT(*) FROM shift
UNION ALL
SELECT 'department', COUNT(*) FROM department
UNION ALL
SELECT 'operator', COUNT(*) FROM operator
UNION ALL
SELECT 'machine', COUNT(*) FROM machine
UNION ALL
SELECT 'product', COUNT(*) FROM product
UNION ALL
SELECT 'supplier', COUNT(*) FROM supplier
UNION ALL
SELECT 'raw_material', COUNT(*) FROM raw_material
UNION ALL
SELECT 'inventory', COUNT(*) FROM inventory
UNION ALL
SELECT 'production_batch', COUNT(*) FROM production_batch
UNION ALL
SELECT 'quality_check', COUNT(*) FROM quality_check
UNION ALL
SELECT 'defect', COUNT(*) FROM defect
UNION ALL
SELECT 'maintenance', COUNT(*) FROM maintenance
UNION ALL
SELECT 'machine_downtime', COUNT(*) FROM machine_downtime
UNION ALL
SELECT 'material_usage', COUNT(*) FROM material_usage
UNION ALL
SELECT 'production_target', COUNT(*) FROM production_target;