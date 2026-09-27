import pandas as pd
import random
import os


OUTPUT_PATH = "../../Dataset/"


def create_machines():

    machine_types = [

        "CNC Machine",
        "Hydraulic Press",
        "Laser Cutting Machine",
        "Injection Molding Machine",
        "Assembly Robot",
        "Welding Machine",
        "Packaging Machine"

    ]


    machines = []


    for i in range(1,76):

        machines.append({

            "machine_id": i,

            "department_id": random.randint(1,18),

            "machine_name": f"Machine-{i:03}",

            "machine_type": random.choice(machine_types),

            "installation_date": pd.Timestamp.today()
            - pd.DateOffset(
                years=random.randint(1,10)
            ),

            "operating_status": random.choice(
                [
                    "Running",
                    "Running",
                    "Running",
                    "Under Maintenance",
                    "Stopped"
                ]
            ),

            "last_maintenance_date":
            pd.Timestamp.today()
            - pd.DateOffset(
                months=random.randint(1,12)
            )

        })


    df = pd.DataFrame(machines)


    os.makedirs(OUTPUT_PATH, exist_ok=True)


    df.to_csv(
        OUTPUT_PATH + "machine.csv",
        index=False
    )


    print("machine.csv created")