from os import getenv
from typing import Generator

import requests

API_HOST = getenv("API_HOST", "localhost")
API_PORT = getenv("API_PORT", 8000)


def get_district_information(replace_umlaut=False) -> Generator:
    """
    Read the district information from district.csv and if necessary replace
    german "umlaute"
    :param replace_umlaut: weather to replace the "umlaute"
    :return: The content each row represented as dictionary
    """
    r = requests.get(
        url=f"http://{API_HOST}:{API_PORT}/districts/get-districts",
        headers={"x-api-key": getenv("SCRAPER_API_KEY", "scraper_api_key")},
    )
    for row in r.json():
        if replace_umlaut:
            dictionary = {ord("ä"): "ae", ord("ö"): "oe", ord("ü"): "ue"}
            row["district_name"] = row["district_name"].translate(dictionary)
        yield row
