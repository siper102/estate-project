from typing import Optional

from pydantic import BaseModel


class EstateORM(BaseModel):
    estate_id: str
    link: str
    area: Optional[float] = None
    rooms: Optional[float] = None
    display_name: Optional[str] = None
    district_number: int = None
    postal_code: Optional[str] = None
    street: Optional[str] = None
    lat: Optional[float] = None
    lon: Optional[float] = None
    construction_year: Optional[int] = None
