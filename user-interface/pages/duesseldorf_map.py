from os import getenv

import folium
import geopandas as gpd
import pandas as pd
import requests
from requests import get
from streamlit_folium import st_folium

API_HOST = getenv("API_HOST")
API_PORT = getenv("API_PORT")
API_KEY = getenv("UI_API_KEY", "ui_api_key")


def read_geo_json():
    url = (
        "https://opendata.duesseldorf.de/sites/default/"
        "files/Stadtteilgrenzen%20Düsseldorf%202021%20ETRS89.geojson"
    )
    r = requests.get(url)

    geo_df = (
        gpd.read_file(r.text, driver="GeoJSON")
        .drop(columns=["Quelle_Ein", "Stand_Gren", "Stadtbezir", "Stadtteilc"])
        .rename(columns={"Stadtteil": "district_number"})
    )
    return geo_df


def read_data():
    r = get(
        url=f"http://{API_HOST}:{API_PORT}/avg-square-metre-price",
        headers={"x-api-key": API_KEY},
    )
    return pd.read_json(r.text)


data = read_data()
geo_df = read_geo_json()
merged = geo_df.merge(right=data)

m = folium.Map(
    location=[51.2277, 6.7735],
    zoom_start=10,
    zoom_control=False,
    scrollWheelZoom=False,
    dragging=False,
)

choropleth = folium.Choropleth(
    geo_data=merged,
    name="choropleth",
    data=data,
    columns=["district_number", "price"],
    key_on="feature.properties.district_number",
    fill_color="Spectral",
    fill_opacity=0.6,
    nan_fill_opacity=0,
    line_opacity=1,
    legend_name="Mean Price",
).add_to(m)

choropleth.geojson.add_child(
    folium.features.GeoJsonTooltip(
        fields=["district_number", "Name", "price", "rooms", "price_per_qm"],
        aliases=[
            "District Number:",
            "District Name:",
            "Average Price",
            "Average Rooms",
            "Average Price per square metre",
        ],
        labels=True,
        localize=True,
        sticky=False,
        style="""
        background-color: #F0EFEF;
        border: 2px solid black;
        border-radius: 3px;
        box-shadow: 3px;
        """,
    )
)

# call to render Folium map in Streamlit
st_data = st_folium(m, width=725)
