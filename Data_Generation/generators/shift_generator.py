import pandas as pd
import os


OUTPUT_PATH = "../../Dataset/"


def create_shifts():

    shifts = [

        {
            "shift_id": 1,
            "shift_name": "Morning Shift",
            "start_time": "06:00:00",
            "end_time": "14:00:00"
        },

        {
            "shift_id": 2,
            "shift_name": "Evening Shift",
            "start_time": "14:00:00",
            "end_time": "22:00:00"
        },

        {
            "shift_id": 3,
            "shift_name": "Night Shift",
            "start_time": "22:00:00",
            "end_time": "06:00:00"
        },

        {
            "shift_id": 4,
            "shift_name": "General Shift",
            "start_time": "09:00:00",
            "end_time": "17:00:00"
        }

    ]


    df = pd.DataFrame(shifts)


    os.makedirs(OUTPUT_PATH, exist_ok=True)


    df.to_csv(
        OUTPUT_PATH + "shift.csv",
        index=False
    )


    print("shift.csv created successfully")