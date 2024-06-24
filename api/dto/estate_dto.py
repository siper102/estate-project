from typing import Optional

from pydantic import BaseModel


class EstateORM(BaseModel):
    estate_id: str
    link: str
    area: float = None
    rooms: float = None
    display_name: str = None
    district_number: int = None
    postal_code: str
    street: Optional[str] = None
    lat: float = None
    lon: float = None
    construction_year: Optional[int] = None
