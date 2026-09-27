import pandas as pd
import random
import os

from faker import Faker


fake = Faker()

OUTPUT_PATH = "../../Dataset/"


def create_suppliers():

    suppliers = []


    materials = [

        "Steel",
        "Aluminium",
        "Copper",
        "Plastic",
        "Electronic Components",
        "Rubber",
        "Glass"

    ]


    for i in range(1,76):

        suppliers.append({

            "supplier_id": i,

            "supplier_name":
            fake.company(),

            "contact_person":
            fake.name(),

            "phone":
            fake.phone_number(),

            "email":
            fake.email(),

            "material_category":
            random.choice(materials),

            "location":
            fake.city(),

            "status":
            random.choice(
                [
                    "Active",
                    "Active",
                    "Inactive"
                ]
            )

        })


    df = pd.DataFrame(suppliers)


    os.makedirs(
        OUTPUT_PATH,
        exist_ok=True
    )


    df.to_csv(
        OUTPUT_PATH+"supplier.csv",
        index=False
    )


    print("supplier.csv created")