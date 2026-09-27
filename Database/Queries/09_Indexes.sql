-- =====================================================
-- Project Name:
-- Manufacturing Quality Analytics & Production Intelligence System
--
-- File:
-- 09_Indexes.sql
--
-- Description:
-- Create indexes to improve query performance
-- for reporting and dashboard queries.
--
-- Author:
-- Afnaan S
-- =====================================================

USE manufacturing_quality_analytics;

-- =====================================================
-- PRODUCTION
-- =====================================================

CREATE INDEX idx_pb_product
ON production_batch(product_id);

CREATE INDEX idx_pb_machine
ON production_batch(machine_id);

CREATE INDEX idx_pb_operator
ON production_batch(operator_id);

CREATE INDEX idx_pb_date
ON production_batch(production_date);

CREATE INDEX idx_pb_status
ON production_batch(batch_status);

-- =====================================================
-- QUALITY
-- =====================================================

CREATE INDEX idx_q_batch
ON quality_check(batch_id);

CREATE INDEX idx_q_result
ON quality_check(inspection_result);

CREATE INDEX idx_q_score
ON quality_check(inspection_score);

-- =====================================================
-- DEFECT
-- =====================================================

CREATE INDEX idx_defect_batch
ON defect(batch_id);

CREATE INDEX idx_defect_date
ON defect(defect_date);

CREATE INDEX idx_defect_type
ON defect(defect_type);

CREATE INDEX idx_defect_severity
ON defect(severity);

-- =====================================================
-- MAINTENANCE
-- =====================================================

CREATE INDEX idx_maintenance_machine
ON maintenance(machine_id);

CREATE INDEX idx_maintenance_date
ON maintenance(maintenance_date);

CREATE INDEX idx_maintenance_status
ON maintenance(status);

-- =====================================================
-- MACHINE DOWNTIME
-- =====================================================

CREATE INDEX idx_downtime_machine
ON machine_downtime(machine_id);

CREATE INDEX idx_downtime_date
ON machine_downtime(downtime_date);

-- =====================================================
-- INVENTORY
-- =====================================================

CREATE INDEX idx_inventory_material
ON inventory(material_id);

CREATE INDEX idx_inventory_location
ON inventory(warehouse_location);

-- =====================================================
-- RAW MATERIAL
-- =====================================================

CREATE INDEX idx_material_supplier
ON raw_material(supplier_id);

CREATE INDEX idx_material_category
ON raw_material(material_category);

-- =====================================================
-- OPERATOR
-- =====================================================

CREATE INDEX idx_operator_department
ON operator(department_id);

CREATE INDEX idx_operator_shift
ON operator(shift_id);

CREATE INDEX idx_operator_status
ON operator(status);

-- =====================================================
-- MACHINE
-- =====================================================

CREATE INDEX idx_machine_department
ON machine(department_id);

CREATE INDEX idx_machine_status
ON machine(operating_status);

-- =====================================================
-- SUPPLIER
-- =====================================================

CREATE INDEX idx_supplier_location
ON supplier(location);

CREATE INDEX idx_supplier_category
ON supplier(material_category);

CREATE INDEX idx_supplier_status
ON supplier(status);

-- =====================================================
-- PRODUCT
-- =====================================================

CREATE INDEX idx_product_category
ON product(category);

CREATE INDEX idx_product_type
ON product(production_type);

-- =====================================================
-- INDEX VERIFICATION
-- =====================================================

SHOW INDEX FROM production_batch;
SHOW INDEX FROM quality_check;
SHOW INDEX FROM machine;
SHOW INDEX FROM operator;
SHOW INDEX FROM inventory;