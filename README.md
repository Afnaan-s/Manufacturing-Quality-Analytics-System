# Manufacturing Quality Analytics System

An end-to-end manufacturing analytics project built using **Python, MySQL, SQL, and Power BI** to analyze production, quality, machine performance, inventory, and workforce operations.

The project follows a complete analytics workflow:

**Data Generation → Data Storage → SQL Analysis → Data Validation → Power BI Modeling → Dashboard Development → Interactive Analysis**

---

## Project Overview

Manufacturing operations generate large volumes of data across production, quality inspection, machines, maintenance, inventory, suppliers, and workforce activities.

This project brings these operational areas together into a centralized analytics solution to monitor performance, identify operational issues, and support data-driven decision-making.

The solution includes:

- Production performance analysis
- Production target and variance analysis
- Quality inspection and defect analysis
- Machine maintenance and downtime analysis
- Inventory and stock-risk analysis
- Workforce and operator analysis
- Interactive Power BI dashboards
- Machine-level drill-through analysis

---

## Business Objectives

The project was designed to answer practical manufacturing questions such as:

- How much has been planned and produced?
- How efficiently are production targets being achieved?
- Which products and plants contribute the most production?
- What are the major quality defects?
- Which machines have higher maintenance cost or downtime?
- Where are inventory levels approaching minimum stock requirements?
- How is the workforce distributed across departments and shifts?
- How experienced is the operator workforce?

---

## Technologies Used

| Technology | Purpose |
|---|---|
| **Python** | Synthetic data generation |
| **Pandas** | Data preparation and processing |
| **Faker** | Realistic synthetic manufacturing records |
| **MySQL** | Database storage and SQL analysis |
| **SQL** | Exploration, validation, analysis, views and stored procedures |
| **Power Query** | Data transformation |
| **DAX** | KPI and analytical measures |
| **Power BI** | Data modeling and interactive dashboards |
| **Git / GitHub** | Version control and project management |

---

## Dataset

The project uses a **synthetic manufacturing dataset** generated with Python.

The dataset contains:

- Plants
- Departments
- Machines
- Operators
- Shifts
- Products
- Suppliers
- Raw Materials
- Inventory
- Production Batches
- Production Targets
- Quality Checks
- Defects
- Maintenance
- Machine Downtime
- Material Usage

### Dataset scale

| Entity | Records |
|---|---:|
| Plants | 5 |
| Departments | 18 |
| Operators | 150 |
| Machines | 75 |
| Products | 40 |
| Suppliers | 75 |
| Raw Materials | 150 |
| Inventory | 150 |
| Production Batches | 10,000 |
| Quality Checks | 10,000 |
| Defects | 3,000 |
| Maintenance | 3,000 |
| Machine Downtime | 4,000 |
| Material Usage | 15,000 |
| Production Targets | 480 |

---

## Data Analytics Workflow

```text
Python Data Generation
        ↓
CSV Dataset
        ↓
MySQL Database
        ↓
SQL Exploration & Validation
        ↓
SQL Analysis & Reporting Views
        ↓
Power BI / Power Query
        ↓
Data Model + DAX Measures
        ↓
Interactive Dashboards
        ↓
Machine Drill-through Analysis
```

---

# SQL Analysis

The SQL layer is organized into separate files for easier maintenance and analysis.

### Database setup

```text
Database/
├── 01_Create_Database.sql
├── 02_Create_Tables.sql
├── 03_Load_Data.sql
└── Queries/
```

### Analytical SQL

```text
Queries/
├── 01_Data_Exploration.sql
├── 02_Production_Analysis.sql
├── 03_Quality_Analysis.sql
├── 04_Machine_Performance.sql
├── 05_Inventory_Analysis.sql
├── 06_Supplier_Analysis.sql
├── 07_Workforce_Analysis.sql
├── 08_Reporting_Views.sql
├── 09_Indexes.sql
└── 10_Stored_Procedures.sql
```

The SQL work covers:

- Data exploration
- Data validation
- Aggregations
- Production analysis
- Quality analysis
- Machine performance
- Inventory analysis
- Supplier analysis
- Workforce analysis
- Reporting views
- Indexing
- Stored procedures

---

# Power BI Dashboard

The Power BI report contains **6 main dashboard pages** and **1 hidden drill-through detail page**.

## 1. Executive Dashboard

Provides a high-level overview of manufacturing operations.

### Main KPIs

| KPI | Overall Output |
|---|---:|
| Total Planned Quantity | **12M** |
| Total Produced Quantity | **12M** |
| Production Efficiency | **94.91%** |
| Total Machines | **75** |
| Total Defects | **3K** |
| Total Maintenance Cost | **30.53M** |

### Main analysis

- Production trend
- Production and target analysis
- Defect distribution
- Maintenance cost by machine
- Overall operational KPIs

---

## 2. Production Dashboard

Focuses on production output, targets, products, plants and shifts.

### Main KPIs

| KPI | Overall Output |
|---|---:|
| Total Planned Quantity | **12M** |
| Total Produced Quantity | **12M** |
| Production Achievement | **94.91%** |
| Total Production Batches | **10K** |
| Average Batch Output | **1.18K** |
| Production Variance | **-635K** |

### Main analysis

- Production by plant
- Production by shift
- Top 10 products by production
- Production vs target
- Production variance
- Production trends

---

## 3. Quality Dashboard

Focuses on inspections, pass/fail performance and defects.

### Main KPIs

| KPI | Overall Output |
|---|---:|
| Total Inspections | **10K** |
| Passed Inspections | **8K** |
| Failed Inspections | **2K** |
| Pass Rate | **84.80%** |
| Average Inspection Score | **84.99** |
| Critical Defects | **742** |

### Main analysis

- Quality result distribution
- Defects by type
- Defects by severity
- Quality score trend
- Top 10 products by defects

---

## 4. Machine Dashboard

Focuses on machine production, maintenance and downtime.

### Main KPIs

| KPI | Overall Output |
|---|---:|
| Total Machines | **75** |
| Total Maintenance Cost | **30.53M** |
| Total Downtime | **974K** |
| Maintenance Events | **3K** |
| Downtime Events | **4K** |
| Average Downtime per Event | **243.39** |

### Main analysis

- Maintenance cost by machine
- Downtime by machine
- Machine production performance
- Maintenance cost by department
- Monthly maintenance cost trend

---

## 5. Inventory Dashboard

Focuses on stock availability and inventory risk.

### Main KPIs

| KPI | Overall Output |
|---|---:|
| Total Stock Quantity | **363K** |
| Total Inventory Items | **150** |
| Total Materials | **150** |
| Low Stock Items | **7** |
| Out of Stock Items | **0** |
| Total Warehouses | **3** |

### Main analysis

- Stock quantity by warehouse
- Top 10 materials by stock quantity
- Low stock items by warehouse
- Stock level vs minimum stock level
- Inventory stock status

---

## 6. Workforce Dashboard

Focuses on operator availability, experience and workforce distribution.

### Main KPIs

| KPI | Overall Output |
|---|---:|
| Total Operators | **150** |
| Active Operators | **107** |
| Inactive Operators | **43** |
| Average Experience | **8.08 years** |
| Experienced Operators | **111** |
| Maximum Experience | **15 years** |

### Main analysis

- Operators by department
- Workforce status by shift
- Average experience by department
- Workforce experience distribution
- Operator joining trend

---

# Machine Details Drill-through

The report includes a hidden **Machine Details** page for detailed machine-level investigation.

A user can right-click a machine from the Machine Dashboard and select:

```text
Drill through → Machine Details
```

The detail page displays machine-specific:

- Production quantity
- Maintenance cost
- Downtime
- Maintenance events
- Downtime events
- Machine production trend
- Machine maintenance cost trend
- Machine downtime trend

A Back button allows users to return to the Machine Dashboard.

---

# Power BI Features Used

The report demonstrates practical Power BI functionality including:

- Power Query
- Data modeling
- Relationships
- Date table
- DAX measures
- KPI cards
- Slicers
- Synced slicers
- Cross-filtering
- Top N analysis
- Bookmarks
- Reset Filters
- Page navigation
- Drill-through
- Hidden detail pages
- Interactive dashboards

---

# Data Validation

Data validation was performed during the project to ensure that the Power BI report was based on consistent source data.

Examples include:

- Duplicate checks
- Relationship validation
- Date filtering validation
- Production and quality record checks
- Inventory uniqueness checks
- KPI verification
- Interactive slicer testing
- Drill-through testing

The final report was tested across multiple plants and machine selections.

---
## Dashboard Preview

### Executive Dashboard
![Executive Dashboard](Power%20BI/Images/Executive.png)

### Production Dashboard
![Production Dashboard](Power%20BI/Images/Production.png)

### Quality Dashboard
![Quality Dashboard](Power%20BI/Images/Quality.png)

### Machine Dashboard
![Machine Dashboard](Power%20BI/Images/Machine.png)

### Inventory Dashboard
![Inventory Dashboard](Power%20BI/Images/Inventory.png)

### Workforce Dashboard
![Workforce Dashboard](Power%20BI/Images/Workforce.png)

### Machine Details
![Machine Details](Power%20BI/Images/Machine_Details.png)

# Project Structure

```text
Manufacturing-Quality-Analytics-System
│
├── Database
│   ├── 01_Create_Database.sql
│   ├── 02_Create_Tables.sql
│   ├── 03_Load_Data.sql
│   └── Queries
│       ├── 01_Data_Exploration.sql
│       ├── 02_Production_Analysis.sql
│       ├── 03_Quality_Analysis.sql
│       ├── 04_Machine_Performance.sql
│       ├── 05_Inventory_Analysis.sql
│       ├── 06_Supplier_Analysis.sql
│       ├── 07_Workforce_Analysis.sql
│       ├── 08_Reporting_Views.sql
│       ├── 09_Indexes.sql
│       └── 10_Stored_Procedures.sql
│
├── Dataset
│   ├── plant.csv
│   ├── department.csv
│   ├── machine.csv
│   ├── operator.csv
│   ├── product.csv
│   ├── supplier.csv
│   ├── raw_material.csv
│   ├── shift.csv
│   ├── inventory.csv
│   ├── production_batch.csv
│   ├── production_target.csv
│   ├── quality_check.csv
│   ├── defect.csv
│   ├── maintenance.csv
│   ├── downtime.csv
│   └── material_usage.csv
│
├── Data_Generation
│   ├── main.py
│   └── generators
│       ├── plant_generator.py
│       ├── department_generator.py
│       ├── machine_generator.py
│       ├── operator_generator.py
│       ├── shift_generator.py
│       ├── product_generator.py
│       ├── supplier_generator.py
│       ├── raw_material_generator.py
│       ├── inventory_generator.py
│       ├── production_batch_generator.py
│       ├── production_target_generator.py
│       ├── quality_check_generator.py
│       ├── defect_generator.py
│       ├── maintenance_generator.py
│       ├── downtime_generator.py
│       └── material_usage_generator.py
│
├── Power BI
│   └── manufacturing_quality_analytics.pbix
│
├── README.md
└── .gitignore
```

---

# Key Project Outcomes

The completed Power BI solution provides a centralized view of manufacturing operations across:

**Production → Quality → Machines → Inventory → Workforce**

The dashboard supports both high-level monitoring and detailed investigation through interactive filtering and machine-level drill-through analysis.

---

# How to Use the Project

### Database

1. Create the MySQL database.
2. Run `01_Create_Database.sql`.
3. Run `02_Create_Tables.sql`.
4. Load the CSV files using `03_Load_Data.sql`.
5. Run the SQL analysis files as required.

### Power BI

1. Open:

```text
Power BI/manufacturing_quality_analytics.pbix
```

2. Refresh the dataset if required.
3. Use the report navigation to move between dashboard pages.
4. Use slicers to filter the analysis.
5. Use the Machine Dashboard to access Machine Details through drill-through.

---

# Author

**Afnaan S**

**Data Analyst | Power BI Developer | SQL Enthusiast**

GitHub: [Afnaan-s](/https://github.com/Afnaan-s)

---

## Disclaimer

This project uses **synthetic data generated for educational and portfolio purposes**. The data does not represent the actual operational data of a real manufacturing organization.