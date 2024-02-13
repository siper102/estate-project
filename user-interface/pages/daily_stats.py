from os import environ as env

import pandas as pd
import streamlit as st
from sqlalchemy import create_engine, text


def get_engine():
    """
    Create sqlalchemy.engine.Engine
    """
    url = "postgresql+psycopg2://{user}:{password}@{host}/{database}"
    engine = create_engine(
        url.format(
            user=env.get("PGUSER"),
            password=env.get("PGPASSWORD"),
            host=env.get("PGHOST"),
            database=env.get("PGDATABASE"),
        )
    )
    return engine


def read_data():
    engine = get_engine()
    query = """
    SELECT *
    FROM estates.daily_stats;
    """
    with engine.connect() as con:
        df = pd.read_sql(sql=text(query), con=con).set_index("date")
    return df


data = read_data()

st.line_chart(data=data, y=["mean_price"])
