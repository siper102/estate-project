from pydantic import BaseModel


class TrainDataDTO(BaseModel):
    district_name: str
    construction_year: int
    rooms: float
    price: float
