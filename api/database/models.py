import enum
from datetime import datetime
from typing import Optional

from sqlmodel import Field, SQLModel


class AccessType(str, enum.Enum):
    SCRAPER_ACCESS = "SCRAPER_ACCESS"
    UI_ACCESS = "UI_ACCESS"
    ML_ACCESS = "ML_ACCESS"
    ADMIN = "ADMIN"


class District(SQLModel, table=True):
    __tablename__ = "district"
    __table_args__ = {"schema": "estates"}

    district_number: int = Field(primary_key=True, default=None)
    district_name: str
    postal_codes: str
    id: int
    lon: float
    lat: float


class Estate(SQLModel, table=True):
    __tablename__ = "estate"
    __table_args__ = {"schema": "estates"}

    estate_id: str = Field(primary_key=True, default=None)
    link: str
    area: Optional[float] = None
    rooms: Optional[float] = None
    display_name: Optional[str] = None
    postal_code: Optional[str]
    street: Optional[str] = None
    lat: Optional[float] = None
    lon: Optional[float] = None
    construction_year: Optional[int] = None
    district_number: int = Field(
        default=None, foreign_key="estates.district.district_number"
    )


class Price(SQLModel, table=True):
    __tablename__ = "price"
    __table_args__ = {"schema": "estates"}

    price: float
    scraped_at: datetime = Field(primary_key=True, default=datetime.now())
    source: str
    estate_id: str = Field(
        default=None, foreign_key="estates.estate.estate_id", primary_key=True
    )


class ScraperStats(SQLModel, table=True):
    __tablename__ = "scraper_stats"
    __table_args__ = {"schema": "estates"}

    id: int | None = Field(default=None, primary_key=True)
    crawl_started: datetime
    crawl_ended: datetime
    time_elapsed: int
    number_requests: int
    number_response: int
    number_response_200: int
    crawler_name: str
    finished_reason: str
    items_scraped: int


class MlStats(SQLModel, table=True):
    __tablename__ = "ml_stats"
    __table_args__ = {"schema": "estates"}

    id: int | None = Field(default=None, primary_key=True)
    tag: str
    trained_at: datetime = datetime.now()
    train_score: float
    test_score: float
    mse_train: float
    in_production: bool
    train_size: int
    test_size: int
    training_time: float


# Write in same database might not be ideal
class ApiUser(SQLModel, table=True):
    __tablename__ = "user"
    __table_args__ = {"schema": "estates"}

    api_key: str = Field(default=None, primary_key=True)
    username: str
    role: AccessType
