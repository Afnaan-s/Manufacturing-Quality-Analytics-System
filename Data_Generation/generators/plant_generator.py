import pandas as pd
import os


OUTPUT_PATH = "../Dataset/"


def create_plants():

    plants = [

        {
            "plant_id": 1,
            "plant_name": "NovaTech Chennai Plant",
            "location": "Chennai, Tamil Nadu",
            "established_date": "2015-06-15",
            "status": "Active"
        },

        {
            "plant_id": 2,
            "plant_name": "NovaTech Coimbatore Plant",
            "location": "Coimbatore, Tamil Nadu",
            "established_date": "2017-03-20",
            "status": "Active"
        },

        {
            "plant_id": 3,
            "plant_name": "NovaTech Bengaluru Electronics Plant",
            "location": "Bengaluru, Karnataka",
            "established_date": "2018-09-10",
            "status": "Active"
        },

        {
            "plant_id": 4,
            "plant_name": "NovaTech Pune Assembly Plant",
            "location": "Pune, Maharashtra",
            "established_date": "2016-11-05",
            "status": "Active"
        },

        {
            "plant_id": 5,
            "plant_name": "NovaTech Hyderabad Quality Plant",
            "location": "Hyderabad, Telangana",
            "established_date": "2020-01-18",
            "status": "Active"
        }

    ]


    df = pd.DataFrame(plants)


    os.makedirs(OUTPUT_PATH, exist_ok=True)


    df.to_csv(
        OUTPUT_PATH + "plant.csv",
        index=False
    )


    print("plant.csv created successfully")