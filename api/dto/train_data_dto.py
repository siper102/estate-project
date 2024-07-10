from pydantic import BaseModel


class TrainDataDTO(BaseModel):
    district_name: str
    area: float
    rooms: float
    price: float
