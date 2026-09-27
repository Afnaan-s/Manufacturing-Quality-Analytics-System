import pandas as pd
import random
import os

from faker import Faker


fake = Faker()

OUTPUT_PATH = "../../Dataset/"


def create_operators():

    operators = []


    for i in range(1,151):

        operators.append({

            "operator_id": i,

            "department_id": random.randint(1,18),

            "shift_id": random.randint(1,4),

            "operator_name": fake.name(),

            "experience_years": random.randint(1,15),

            "joining_date": fake.date_between(
                start_date="-10y",
                end_date="today"
            ),

            "status": random.choice(
                [
                    "Active",
                    "Active",
                    "Active",
                    "Inactive"
                ]
            )

        })


    df = pd.DataFrame(operators)


    os.makedirs(OUTPUT_PATH, exist_ok=True)


    df.to_csv(
        OUTPUT_PATH + "operator.csv",
        index=False
    )


    print("operator.csv created")