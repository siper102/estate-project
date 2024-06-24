from os import getenv

import requests
from pydantic import BaseModel, Field, field_validator

API_HOST = getenv("API_HOST", "localhost")
API_PORT = getenv("API_PORT", 8000)

district_names: list[str] = requests.get(
    f"http://{API_HOST}:{API_PORT}/districts/names",
).json()


class EstateInput(BaseModel):
    district_name: str
    rooms: float = Field(ge=1)
    construction_year: int = Field(ge=1990)

    @field_validator("district_name")
    @classmethod
    def validate_district_name(cls, v):
        if v not in district_names:
            raise ValueError("No valid district name given")
        return v
