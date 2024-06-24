from database.database_manager import get_session
from database.models import AccessType, District, Estate, Price
from dto.daily_stats_dto import DailyStatsDTO
from dto.price_per_sqm_dto import PricePerSqmDTO
from fastapi import APIRouter, Depends
from security.api_key_manager import api_key_header, authorize
from sqlalchemy import Date, cast, func
from sqlmodel import Session, select

ui_router = APIRouter()
USER_ROLES = [AccessType.UI_ACCESS, AccessType.ADMIN]


@ui_router.get("/avg-square-metre-price")
@authorize(roles=USER_ROLES)
def get_avg_square_metre_price(
    session: Session = Depends(get_session), api_key: str = Depends(api_key_header)
) -> list[PricePerSqmDTO]:
    stm = (
        select(
            District.district_number,
            func.avg(Price.price).label("price"),
            func.avg(Estate.rooms).label("rooms"),
            func.avg(Price.price / Estate.area).label("price_per_qm"),
        )
        .join(District)
        .join(Price)
        .group_by(District.district_number)
    )
    res = session.exec(stm).mappings().all()
    return res


@ui_router.get("/daily-stats")
@authorize(roles=USER_ROLES)
def get_daily_stats(
    session: Session = Depends(get_session), api_key: str = Depends(api_key_header)
) -> list[DailyStatsDTO]:
    stm = (
        select(
            cast(Price.scraped_at, Date).label("date_scraped"),
            func.avg(Price.price).label("mean_price"),
            func.stddev(Price.price).label("stddev"),
            func.min(Price.price).label("min"),
            func.max(Price.price).label("max"),
        )
        .select_from(Estate)
        .join(Price)
        .group_by(cast(Price.scraped_at, Date))
    )
    res = session.exec(stm).mappings().all()
    return res
