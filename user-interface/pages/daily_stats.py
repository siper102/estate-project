from os import getenv

import pandas as pd
import streamlit as st
from requests import get

API_HOST = getenv("API_HOST", "localhost")
API_PORT = getenv("API_PORT", 8000)
API_KEY = getenv("UI_API_KEY", "ui_api_key")


def read_data():
    r = get(
        url=f"http://{API_HOST}:{API_PORT}/daily-stats", headers={"x-api-key": API_KEY}
    )
    return pd.read_json(r.text).set_index("date_scraped")


data = read_data()

st.line_chart(data=data, y=["mean_price"])
