import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.engine.url import URL
import matplotlib.pyplot as plt
import configparser
import streamlit as st


def get_engine():
    parser = configparser.ConfigParser()
    parser.read("data/credentials.ini")
    engine = create_engine(URL.create(**parser["DATABASE"]))
    return engine


def read_data():
    engine = get_engine()
    query = """
    SELECT *
    FROM daily_stats;
    """
    df = pd.read_sql(query, engine).set_index("date")
    return df


data = read_data()

st.line_chart(data=data, y=["mean_price"])
