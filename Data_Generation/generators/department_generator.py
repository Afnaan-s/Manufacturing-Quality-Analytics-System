import pandas as pd
import os


OUTPUT_PATH = "../../Dataset/"


def create_departments():

    departments = [

        (1, "Production", "Arun Kumar"),
        (1, "Quality Control", "Priya Sharma"),
        (1, "Maintenance", "Rahul Verma"),

        (2, "Production", "Karthik Raj"),
        (2, "Assembly", "Meena Devi"),
        (2, "Inventory", "Sanjay Kumar"),

        (3, "Electronics", "Vijay Anand"),
        (3, "Quality Control", "Divya Rao"),
        (3, "Research", "Nithin Kumar"),

        (4, "Assembly", "Ramesh Patel"),
        (4, "Maintenance", "Amit Shah"),
        (4, "Packaging", "Neha Singh"),

        (5, "Quality Testing", "Sneha Iyer"),
        (5, "Inspection", "Naveen Rao"),
        (5, "Analysis", "Kavya Menon"),

        (1, "Logistics", "Suresh Kumar"),
        (2, "Warehouse", "Manoj Das"),
        (4, "Planning", "Deepak Joshi")

    ]


    data = []


    for index, dept in enumerate(departments, start=1):

        data.append({

            "department_id": index,
            "plant_id": dept[0],
            "department_name": dept[1],
            "department_head": dept[2]

        })


    df = pd.DataFrame(data)


    os.makedirs(OUTPUT_PATH, exist_ok=True)

    df.to_csv(
        OUTPUT_PATH + "department.csv",
        index=False
    )


    print("department.csv created")