import pandas as pd
import random
import os
from datetime import datetime, timedelta


OUTPUT_PATH = "../../Dataset/"


def create_downtime():

    records = []


    reasons = [

        "Machine Failure",
        "Power Failure",
        "Material Shortage",
        "Operator Issue",
        "Maintenance"

    ]


    for i in range(1,4001):

        records.append({

            "downtime_id": i,

            "machine_id":
            random.randint(1,75),

            "downtime_date":
            datetime(2025,1,1)
            +
            timedelta(
                days=random.randint(0,365)
            ),

            "downtime_minutes":
            random.randint(
                10,
                480
            ),

            "reason":
            random.choice(
                reasons
            ),

            "resolved":
            random.choice(
                [
                    "Yes",
                    "Yes",
                    "No"
                ]
            )

        })


    df = pd.DataFrame(records)


    os.makedirs(
        OUTPUT_PATH,
        exist_ok=True
    )


    df.to_csv(
        OUTPUT_PATH+"downtime.csv",
        index=False
    )


    print("downtime.csv created")