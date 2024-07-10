import json
from os import getenv

import requests
import streamlit as st

API_HOST = getenv("API_HOST", "localhost")
API_PORT = getenv("API_PORT", 8000)
BENTOML_HOST = getenv("BENTOML_HOST", "localhost")
BENTOML_PORT = getenv("BENTOML_PORT", 3000)


def get_district_names() -> list[str]:
    return requests.get(f"http://{API_HOST}:{API_PORT}/districts/names").json()


st.title("Estate App")

data = {}

data["district_name"] = st.selectbox(
    "District Name", get_district_names(), help="Name of the District in Duesseldorf"
)

data["rooms"] = st.number_input("Rooms", min_value=1, value=1, help="Number of rooms")

area = st.number_input("Area", min_value=1, value=1, help="The area of the Flat")


if st.button("Get predicted monthly rent"):
    pred = requests.post(
        url=f"http://{BENTOML_HOST}:{BENTOML_PORT}/predict",
        headers={"content-type": "application/json"},
        data=json.dumps(data),
    ).json()
    st.write(f"Estimated monthly rent is {round(pred['monthly_rental_price'], 2)}€")
