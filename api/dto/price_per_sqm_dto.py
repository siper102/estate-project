from pydantic import BaseModel


class PricePerSqmDTO(BaseModel):
    district_number: int
    price: float
    rooms: float
    price_per_qm: float
