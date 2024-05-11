import json
from os import environ as env

import requests
import streamlit as st


def get_district_names():
    with open("data/districts.txt", "r") as f:
        content = f.read().splitlines()
    return content


st.title("Estate App")
BENTOML_HOST = env.get("BENTOML_HOST", "localhost")

data = {}

data["district_name"] = st.selectbox(
    "District Name", get_district_names(), help="Name of the District in Duesseldorf"
)

data["rooms"] = st.number_input("Rooms", min_value=1, value=1, help="Number of rooms")

area = st.number_input("Area", min_value=1, value=1, help="The area of the Flat")

data["construction_year"] = st.number_input(
    "Year of construction", min_value=1990, max_value=2024, help="Year of construction"
)

if st.button("Get predicted monthly rent"):
    pred = requests.post(
        url=f"http://{BENTOML_HOST}:3000/predict",
        headers={"content-type": "application/json"},
        data=json.dumps(data),
    ).json()
    st.write(f"Estimated monthly rent/m^2 is {round(pred[0], 2)}€")
    if area:
        st.write(f"Estimated monthly rent is {round(pred[0]) * area}")
