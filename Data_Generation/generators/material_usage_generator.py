import pandas as pd
import random
import os


OUTPUT_PATH = "../../Dataset/"


def create_material_usage():

    usage = []


    for i in range(1,15001):

        usage.append({

            "usage_id": i,

            "batch_id":
            random.randint(
                1,
                10000
            ),

            "material_id":
            random.randint(
                1,
                150
            ),

            "quantity_used":
            round(
                random.uniform(
                    1,
                    500
                ),
                2
            ),

            "unit":
            random.choice(
                [
                    "Kg",
                    "Pieces",
                    "Liters"
                ]
            )

        })


    df = pd.DataFrame(usage)


    os.makedirs(
        OUTPUT_PATH,
        exist_ok=True
    )


    df.to_csv(
        OUTPUT_PATH+"material_usage.csv",
        index=False
    )


    print("material_usage.csv created")