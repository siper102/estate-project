from __future__ import annotations

from datetime import datetime
from typing import Optional

from pydantic import AnyHttpUrl, BaseModel


class Price(BaseModel):
    price: float
    scraped_at: datetime = datetime.now()
    source: str


class Estate(BaseModel):
    estate_id: str
    link: AnyHttpUrl
    area: float = None
    rooms: float = None
    display_name: str = None
    location: str
    postal_code: str
    street: Optional[str] = None
    lat: float = None
    lon: float = None
    price_item: Price = None
    construction_year: Optional[int] = None
