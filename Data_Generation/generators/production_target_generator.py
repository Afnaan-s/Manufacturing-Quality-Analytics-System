import pandas as pd
import random
import os


OUTPUT_PATH = "../../Dataset/"


def create_production_targets():

    targets = []


    id = 1


    for product in range(1,41):

        for month in range(1,13):

            targets.append({

                "target_id": id,

                "product_id":
                product,

                "month":
                month,

                "target_quantity":
                random.randint(
                    5000,
                    20000
                )

            })


            id += 1


    df = pd.DataFrame(targets)


    os.makedirs(
        OUTPUT_PATH,
        exist_ok=True
    )


    df.to_csv(
        OUTPUT_PATH+"production_target.csv",
        index=False
    )


    print("production_target.csv created")