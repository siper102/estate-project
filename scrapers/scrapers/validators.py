from __future__ import annotations

from typing import Optional

from pydantic import BaseModel


class Estate(BaseModel):
    estate_id: str
    link: str
    area: float = None
    rooms: float = None
    display_name: str = None
    district_number: int
    postal_code: str
    street: Optional[str] = None
    lat: float = None
    lon: float = None
    construction_year: Optional[int] = None


class Price(BaseModel):
    price: float
    # scraped_at: datetime = datetime.now()
    source: str
    estate: Estate = None
