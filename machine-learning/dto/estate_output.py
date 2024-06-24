from pydantic import BaseModel


class EstateOutput(BaseModel):
    monthly_rental_price: float
