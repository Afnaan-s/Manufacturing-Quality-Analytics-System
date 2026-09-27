import pandas as pd
import random
import os


OUTPUT_PATH = "../../Dataset/"


def create_raw_materials():

    material_names = [

        "Steel Sheet",
        "Aluminium Rod",
        "Copper Wire",
        "Plastic Granules",
        "Silicon Chip",
        "Rubber Seal",
        "Glass Panel",
        "Electronic Sensor",
        "Battery Cell",
        "Carbon Fiber"

    ]


    materials = []


    for i in range(1,151):

        materials.append({

            "material_id": i,

            "supplier_id":
            random.randint(1,75),

            "material_name":
            f"{random.choice(material_names)} {i}",


            "material_category":
            random.choice(
                [
                    "Metal",
                    "Electronic",
                    "Plastic",
                    "Chemical"
                ]
            ),


            "unit":
            random.choice(
                [
                    "Kg",
                    "Pieces",
                    "Liters"
                ]
            ),


            "unit_cost":
            round(
                random.uniform(50,5000),
                2
            ),


            "reorder_level":
            random.randint(
                50,
                500
            )


        })


    df = pd.DataFrame(materials)


    os.makedirs(
        OUTPUT_PATH,
        exist_ok=True
    )


    df.to_csv(
        OUTPUT_PATH+"raw_material.csv",
        index=False
    )


    print("raw_material.csv created")