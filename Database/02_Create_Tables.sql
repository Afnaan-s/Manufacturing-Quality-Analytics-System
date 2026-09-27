-- =====================================================
-- Project Name:
-- Manufacturing Quality Analytics & Production Intelligence System
--
-- File:
-- 02_Create_Tables.sql
--
-- Purpose:
-- Creates all database tables with Primary Keys
-- and Foreign Keys.
-- =====================================================

USE manufacturing_quality_analytics;

-- =====================================================
-- 1. Plant
-- =====================================================

CREATE TABLE plant (
    plant_id INT PRIMARY KEY,
    plant_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    established_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Active'
);

-- =====================================================
-- 2. Shift
-- =====================================================

CREATE TABLE shift (
    shift_id INT PRIMARY KEY,
    shift_name VARCHAR(50) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL
);

-- =====================================================
-- 3. Supplier
-- =====================================================

CREATE TABLE supplier (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(150) NOT NULL,
    contact_person VARCHAR(100) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    material_category VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Active'
);

-- =====================================================
-- 4. Product
-- =====================================================

CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    production_type VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Active'
);

-- =====================================================
-- 5. Department
-- =====================================================

CREATE TABLE department (
    department_id INT PRIMARY KEY,
    plant_id INT NOT NULL,
    department_name VARCHAR(100) NOT NULL,
    department_head VARCHAR(100) NOT NULL,

    CONSTRAINT fk_department_plant
        FOREIGN KEY (plant_id)
        REFERENCES plant(plant_id)
);

-- =====================================================
-- 6. Raw Material
-- =====================================================

CREATE TABLE raw_material (
    material_id INT PRIMARY KEY,
    supplier_id INT NOT NULL,
    material_name VARCHAR(150) NOT NULL,
    material_category VARCHAR(100) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    unit_cost DECIMAL(10,2) NOT NULL,
    reorder_level INT NOT NULL,

    CONSTRAINT fk_rawmaterial_supplier
        FOREIGN KEY (supplier_id)
        REFERENCES supplier(supplier_id)
);

-- =====================================================
-- 7. Operator
-- =====================================================

CREATE TABLE operator (
    operator_id INT PRIMARY KEY,
    department_id INT NOT NULL,
    shift_id INT NOT NULL,
    operator_name VARCHAR(100) NOT NULL,
    experience_years INT NOT NULL,
    joining_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Active',

    CONSTRAINT fk_operator_department
        FOREIGN KEY (department_id)
        REFERENCES department(department_id),

    CONSTRAINT fk_operator_shift
        FOREIGN KEY (shift_id)
        REFERENCES shift(shift_id)
);

-- =====================================================
-- 8. Machine
-- =====================================================

CREATE TABLE machine (
    machine_id INT PRIMARY KEY,
    department_id INT NOT NULL,
    machine_name VARCHAR(100) NOT NULL,
    machine_type VARCHAR(100) NOT NULL,
    installation_date DATE NOT NULL,
    operating_status VARCHAR(30) NOT NULL,
    last_maintenance_date DATE NOT NULL,

    CONSTRAINT fk_machine_department
        FOREIGN KEY (department_id)
        REFERENCES department(department_id)
);

-- =====================================================
-- 9. Inventory
-- =====================================================

CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    material_id INT NOT NULL,
    available_quantity INT NOT NULL,
    minimum_stock_level INT NOT NULL,
    warehouse_location VARCHAR(100) NOT NULL,

    CONSTRAINT fk_inventory_material
        FOREIGN KEY (material_id)
        REFERENCES raw_material(material_id)
);

-- =====================================================
-- 10. Production Batch
-- =====================================================

CREATE TABLE production_batch (
    batch_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    machine_id INT NOT NULL,
    operator_id INT NOT NULL,
    production_date DATE NOT NULL,
    planned_quantity INT NOT NULL,
    produced_quantity INT NOT NULL,
    batch_status VARCHAR(30) NOT NULL,

    CONSTRAINT fk_batch_product
        FOREIGN KEY (product_id)
        REFERENCES product(product_id),

    CONSTRAINT fk_batch_machine
        FOREIGN KEY (machine_id)
        REFERENCES machine(machine_id),

    CONSTRAINT fk_batch_operator
        FOREIGN KEY (operator_id)
        REFERENCES operator(operator_id)
);

-- =====================================================
-- 11. Quality Check
-- =====================================================

CREATE TABLE quality_check (
    quality_id INT PRIMARY KEY,
    batch_id INT NOT NULL,
    inspection_score DECIMAL(5,2) NOT NULL,
    inspection_result VARCHAR(20) NOT NULL,
    inspector_name VARCHAR(100) NOT NULL,
    remarks VARCHAR(255),

    CONSTRAINT fk_quality_batch
        FOREIGN KEY (batch_id)
        REFERENCES production_batch(batch_id)
);

-- =====================================================
-- 12. Defect
-- =====================================================

CREATE TABLE defect (
    defect_id INT PRIMARY KEY,
    batch_id INT NOT NULL,
    defect_type VARCHAR(100) NOT NULL,
    severity VARCHAR(20) NOT NULL,
    defect_date DATE NOT NULL,
    resolution_status VARCHAR(30) NOT NULL,

    CONSTRAINT fk_defect_batch
        FOREIGN KEY (batch_id)
        REFERENCES production_batch(batch_id)
);

-- =====================================================
-- 13. Maintenance
-- =====================================================

CREATE TABLE maintenance (
    maintenance_id INT PRIMARY KEY,
    machine_id INT NOT NULL,
    maintenance_type VARCHAR(50) NOT NULL,
    maintenance_date DATE NOT NULL,
    technician_name VARCHAR(100) NOT NULL,
    maintenance_cost DECIMAL(10,2) NOT NULL,
    status VARCHAR(30) NOT NULL,

    CONSTRAINT fk_maintenance_machine
        FOREIGN KEY (machine_id)
        REFERENCES machine(machine_id)
);

-- =====================================================
-- 14. Machine Downtime
-- =====================================================

CREATE TABLE machine_downtime (
    downtime_id INT PRIMARY KEY,
    machine_id INT NOT NULL,
    downtime_date DATE NOT NULL,
    downtime_minutes INT NOT NULL,
    reason VARCHAR(200) NOT NULL,
    resolved VARCHAR(20) NOT NULL,

    CONSTRAINT fk_downtime_machine
        FOREIGN KEY (machine_id)
        REFERENCES machine(machine_id)
);

-- =====================================================
-- 15. Material Usage
-- =====================================================

CREATE TABLE material_usage (
    usage_id INT PRIMARY KEY,
    batch_id INT NOT NULL,
    material_id INT NOT NULL,
    quantity_used DECIMAL(10,2) NOT NULL,
    unit VARCHAR(20) NOT NULL,

    CONSTRAINT fk_usage_batch
        FOREIGN KEY (batch_id)
        REFERENCES production_batch(batch_id),

    CONSTRAINT fk_usage_material
        FOREIGN KEY (material_id)
        REFERENCES raw_material(material_id)
);

-- =====================================================
-- 16. Production Target
-- =====================================================

CREATE TABLE production_target (
    target_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    month INT NOT NULL,
    target_quantity INT NOT NULL,

    CONSTRAINT fk_target_product
        FOREIGN KEY (product_id)
        REFERENCES product(product_id)
);

SHOW TABLES;

SELECT COUNT(*)
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'manufacturing_quality_analytics';

