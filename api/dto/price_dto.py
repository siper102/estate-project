from pydantic import BaseModel

from .estate_dto import EstateORM


class PriceDTO(BaseModel):
    price: float
    source: str
    estate: EstateORM
