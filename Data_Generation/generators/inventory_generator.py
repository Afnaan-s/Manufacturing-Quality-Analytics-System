import pandas as pd
import random
import os


OUTPUT_PATH = "../../Dataset/"


def create_inventory():

    inventory = []


    for i in range(1,151):

        inventory.append({

            "inventory_id": i,

            "material_id": i,

            "available_quantity":
            random.randint(
                100,
                5000
            ),

            "minimum_stock_level":
            random.randint(
                50,
                500
            ),

            "warehouse_location":
            random.choice(
                [
                    "Warehouse A",
                    "Warehouse B",
                    "Warehouse C"
                ]
            )

        })


    df = pd.DataFrame(inventory)


    os.makedirs(
        OUTPUT_PATH,
        exist_ok=True
    )


    df.to_csv(
        OUTPUT_PATH+"inventory.csv",
        index=False
    )


    print("inventory.csv created")