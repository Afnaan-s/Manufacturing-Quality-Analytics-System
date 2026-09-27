import pandas as pd
import random
import os


OUTPUT_PATH = "../../Dataset/"


def create_products():

    product_names = [

        "Automotive Gear",
        "Brake Assembly",
        "Engine Component",
        "Transmission Shaft",
        "Electronic Control Unit",
        "Sensor Module",
        "Power Circuit Board",
        "Industrial Motor",
        "Hydraulic Valve",
        "Control Panel"

    ]


    categories = [

        "Automotive",
        "Electronics",
        "Industrial"

    ]


    products = []


    for i in range(1,41):

        products.append({

            "product_id": i,

            "product_name":
            f"{random.choice(product_names)} {i}",

            "category":
            random.choice(categories),

            "unit_price":
            round(
                random.uniform(500,50000),
                2
            ),

            "production_type":
            random.choice(
                [
                    "Mass Production",
                    "Custom Production"
                ]
            ),

            "status": "Active"

        })


    df = pd.DataFrame(products)


    os.makedirs(
        OUTPUT_PATH,
        exist_ok=True
    )


    df.to_csv(
        OUTPUT_PATH+"product.csv",
        index=False
    )


    print("product.csv created")