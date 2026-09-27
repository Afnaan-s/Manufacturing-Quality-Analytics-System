import pandas as pd
import random
import os
from datetime import datetime, timedelta


OUTPUT_PATH = "../../Dataset/"


def create_maintenance():

    records = []


    maintenance_types = [

        "Preventive Maintenance",
        "Corrective Maintenance",
        "Emergency Repair",
        "Inspection"

    ]


    for i in range(1,3001):

        start = datetime(2025,1,1)


        records.append({

            "maintenance_id": i,

            "machine_id":
            random.randint(1,75),

            "maintenance_type":
            random.choice(
                maintenance_types
            ),

            "maintenance_date":
            start +
            timedelta(
                days=random.randint(0,365)
            ),

            "technician_name":
            random.choice(
                [
                    "Ravi",
                    "Arun",
                    "Suresh",
                    "Karthik",
                    "Manoj"
                ]
            ),

            "maintenance_cost":
            round(
                random.uniform(500,20000),
                2
            ),

            "status":
            random.choice(
                [
                    "Completed",
                    "Completed",
                    "Pending"
                ]
            )

        })


    df = pd.DataFrame(records)


    os.makedirs(
        OUTPUT_PATH,
        exist_ok=True
    )


    df.to_csv(
        OUTPUT_PATH+"maintenance.csv",
        index=False
    )


    print("maintenance.csv created")