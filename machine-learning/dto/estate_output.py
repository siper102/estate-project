from pydantic import BaseModel


class EstateOutput(BaseModel):
    monthly_rental_price: float
    predictor_version: str
