import pandas as pd
import random
import os
from datetime import datetime, timedelta


OUTPUT_PATH = "../../Dataset/"


def create_production_batches():

    batches = []


    start_date = datetime(2025, 1, 1)


    for i in range(1, 10001):

        planned_qty = random.randint(
            500,
            2000
        )


        production_efficiency = random.uniform(
            0.85,
            1.05
        )


        actual_qty = int(
            planned_qty * production_efficiency
        )


        batches.append({

            "batch_id": i,

            "product_id":
            random.randint(1,40),

            "machine_id":
            random.randint(1,75),

            "operator_id":
            random.randint(1,150),

            "production_date":
            start_date + timedelta(
                days=random.randint(0,365)
            ),

            "planned_quantity":
            planned_qty,

            "produced_quantity":
            actual_qty,

            "batch_status":
            random.choice(
                [
                    "Completed",
                    "Completed",
                    "Completed",
                    "Rejected",
                    "Delayed"
                ]
            )

        })


    df = pd.DataFrame(batches)


    os.makedirs(
        OUTPUT_PATH,
        exist_ok=True
    )


    df.to_csv(
        OUTPUT_PATH+"production_batch.csv",
        index=False
    )


    print("production_batch.csv created")