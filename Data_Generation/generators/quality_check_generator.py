import pandas as pd
import random
import os


OUTPUT_PATH = "../../Dataset/"


def create_quality_checks():

    quality_records = []


    for i in range(1,10001):

        defect_probability = random.random()


        if defect_probability < 0.85:

            result = "Pass"

        else:

            result = "Fail"



        quality_records.append({

            "quality_id": i,


            "batch_id":
            i,


            "inspection_score":
            round(
                random.uniform(70,100),
                2
            ),


            "inspection_result":
            result,


            "inspector_name":
            random.choice(
                [
                    "Anitha",
                    "Rajesh",
                    "Priya",
                    "Kumar",
                    "Sneha"
                ]
            ),


            "remarks":
            random.choice(
                [
                    "Approved",
                    "Minor issue found",
                    "Requires inspection",
                    "Rejected"
                ]
            )

        })


    df = pd.DataFrame(
        quality_records
    )


    os.makedirs(
        OUTPUT_PATH,
        exist_ok=True
    )


    df.to_csv(
        OUTPUT_PATH+"quality_check.csv",
        index=False
    )


    print("quality_check.csv created")