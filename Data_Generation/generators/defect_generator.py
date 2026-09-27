import pandas as pd
import random
import os
from datetime import datetime, timedelta


OUTPUT_PATH = "../../Dataset/"


def create_defects():

    defects = []


    defect_types = [

        "Surface Damage",
        "Dimension Error",
        "Material Defect",
        "Assembly Error",
        "Electrical Failure",
        "Machine Error"

    ]


    severity_levels = [

        "Low",
        "Medium",
        "High",
        "Critical"

    ]


    for i in range(1,3001):

        defects.append({

            "defect_id":

            i,


            "batch_id":

            random.randint(
                1,
                10000
            ),


            "defect_type":

            random.choice(
                defect_types
            ),


            "severity":

            random.choice(
                severity_levels
            ),


            "defect_date":

            datetime(2025,1,1)
            +
            timedelta(
                days=random.randint(
                    0,
                    365
                )
            ),


            "resolution_status":

            random.choice(
                [
                    "Resolved",
                    "Under Review",
                    "Scrapped"
                ]
            )

        })


    df = pd.DataFrame(
        defects
    )


    os.makedirs(
        OUTPUT_PATH,
        exist_ok=True
    )


    df.to_csv(
        OUTPUT_PATH+"defect.csv",
        index=False
    )


    print("defect.csv created")