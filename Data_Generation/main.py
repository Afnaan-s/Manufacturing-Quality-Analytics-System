# =====================================================
# MAIN DATA GENERATION FILE
# =====================================================

print("Starting Manufacturing Dataset Generation...\n")


# Master Data
from generators.plant_generator import create_plants
from generators.shift_generator import create_shifts
from generators.department_generator import create_departments
from generators.operator_generator import create_operators
from generators.machine_generator import create_machines
from generators.product_generator import create_products
from generators.supplier_generator import create_suppliers
from generators.raw_material_generator import create_raw_materials


# Transaction Data
from generators.production_batch_generator import create_production_batches
from generators.quality_check_generator import create_quality_checks
from generators.defect_generator import create_defects
from generators.maintenance_generator import create_maintenance
from generators.downtime_generator import create_downtime
from generators.material_usage_generator import create_material_usage
from generators.inventory_generator import create_inventory
from generators.production_target_generator import create_production_targets



# =====================================================
# EXECUTION ORDER
# =====================================================


print("Creating Master Data...\n")


create_plants()

create_shifts()

create_departments()

create_operators()

create_machines()

create_products()

create_suppliers()

create_raw_materials()



print("\nMaster Data Completed ✅\n")



print("Creating Transaction Data...\n")


create_inventory()

create_production_batches()

create_quality_checks()

create_defects()

create_maintenance()

create_downtime()

create_material_usage()

create_production_targets()



print("\nTransaction Data Completed ✅")


print("\n====================================")

print("Manufacturing Dataset Generated Successfully 🚀")

print("====================================")