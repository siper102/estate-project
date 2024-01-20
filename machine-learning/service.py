import bentoml
from bentoml.io import JSON
from pydantic import BaseModel, Field, field_validator


def get_district_names():
    with open("data/districts.txt", "r") as f:
        content = f.read().splitlines()
    return content


class EstateInput(BaseModel):
    district_name: str
    rooms: float = Field(ge=1)
    area: float = Field(ge=1)
    construction_year: int

    @field_validator("district_name")
    @classmethod
    def validate_district_name(cls, v):
        if v not in get_district_names():
            raise ValueError("No valid district name given")
        return v


class EstateOutput(BaseModel):
    monthly_rental_price: float


regression_runner = bentoml.sklearn.get("estate-regressor:latest").to_runner()
tree = bentoml.Service("estate_fastapi_demo", runners=[regression_runner])


@tree.api(
    input=JSON(pydantic_model=EstateInput), output=JSON(pydantic_model=EstateOutput)
)
def predict(input_series: EstateInput) -> EstateOutput:
    result = regression_runner.run(input_series.model_dump())
    return result
