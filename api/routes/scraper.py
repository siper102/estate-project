from database.database_manager import get_session
from database.models import AccessType, Estate, Price, ScraperStats
from dto.price_dto import PriceDTO
from fastapi import APIRouter, Depends
from security.api_key_manager import api_key_header, authorize
from sqlmodel import Session, select

scraper_router = APIRouter()
USER_ROLES = [AccessType.SCRAPER_ACCESS, AccessType.ADMIN]


@scraper_router.post("/scraper-stats")
@authorize(roles=USER_ROLES)
def insert_scraper_stats(
    scraper_stats: ScraperStats,
    session: Session = Depends(get_session),
    api_key: str = Depends(api_key_header),
):
    session.add(scraper_stats)
    session.commit()


@scraper_router.post("/prices")
@authorize(roles=USER_ROLES)
def insert_price_with_estate(
    price_orm: PriceDTO,
    session: Session = Depends(get_session),
    api_key: str = Depends(api_key_header),
):
    print(price_orm)
    estate_orm = price_orm.estate
    print(estate_orm)
    price = Price.model_validate(price_orm)
    price.estate_id = estate_orm.estate_id
    existing_estate_query = select(Estate).where(
        Estate.estate_id == estate_orm.estate_id
    )
    existing_estate = session.exec(existing_estate_query).first()
    if existing_estate is None:
        session.add(Estate.model_validate(estate_orm))
    session.add(price)
    session.commit()
