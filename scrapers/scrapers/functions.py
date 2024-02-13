from configparser import ConfigParser, NoSectionError
from csv import DictReader
from io import StringIO
from os import environ as env
from pkgutil import get_data
from typing import Generator

from sqlalchemy import create_engine
from sqlalchemy_utils import create_database, database_exists

from scrapers.model import Base


def read_credentials(section: str) -> dict:
    """
    Read credentials from the .ini file.
    :param section: name of the section
    :return: the content of the section
    """
    cred = get_data("scrapers", "data/credentials.ini")
    config = ConfigParser()
    config.read_string(cred.decode("utf-8"))
    if section not in config:
        raise NoSectionError(f"{section} not in .ini file")
    return dict(config[section])


def get_district_information(replace_umlaut=False) -> Generator:
    """
    Read the district information from district.csv and if necessary replace
    german "umlaute"
    :param replace_umlaut: weather to replace the "umlaute"
    :return: The content each row represented as dictionary
    """
    csv_content = get_data("scrapers", "data/district.csv")
    buff = StringIO(csv_content.decode("utf-8"))
    reader = DictReader(buff)
    for row in reader:
        if replace_umlaut:
            dictionary = {ord("ä"): "ae", ord("ö"): "oe", ord("ü"): "ue"}
            row["district_name"] = row["district_name"].translate(dictionary)
        yield row


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
    if not database_exists(engine.url):
        create_database(engine.url)
    # Create Tables if not exist
    Base.metadata.create_all(engine, checkfirst=True)
    return engine
