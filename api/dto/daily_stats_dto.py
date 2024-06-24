from datetime import date

from pydantic import BaseModel


class DailyStatsDTO(BaseModel):
    date_scraped: date
    mean_price: float
    stddev: float
    min: float
    max: float
