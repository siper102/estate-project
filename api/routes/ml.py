from typing import Sequence

from database.database_manager import get_session
from database.models import AccessType, District, Estate, MlStats, Price
from dto.train_data_dto import TrainDataDTO
from fastapi import APIRouter, Depends
from security.api_key_manager import api_key_header, authorize
from sqlalchemy.sql import label
from sqlmodel import Session, select

ml_router = APIRouter()
USER_ROLES = [AccessType.ML_ACCESS, AccessType.ADMIN]


@ml_router.post("/ml-stats")
@authorize(roles=USER_ROLES)
def insert_ml_stat(
    ml_stats: MlStats,
    session: Session = Depends(get_session),
    api_key: str = Depends(api_key_header),
):
    session.add(ml_stats)
    session.commit()


@ml_router.get("/ml-stats")
@authorize(roles=USER_ROLES)
def get_ml_stats(
    last_n: int = -1,
    session: Session = Depends(get_session),
    api_key: str = Depends(api_key_header),
) -> Sequence[MlStats]:
    stm = select(MlStats).order_by(MlStats.id.desc())
    if last_n is not None and last_n > 0:
        stm = stm.limit(last_n)
    ml_stats = session.exec(stm).all()
    return ml_stats


@ml_router.get("/train-data")
@authorize(roles=USER_ROLES)
def get_train_data(
    session: Session = Depends(get_session), api_key: str = Depends(api_key_header)
) -> list[TrainDataDTO]:
    models = []
    stm = (
        select(
            District.district_name,
            Estate.construction_year,
            Estate.rooms,
            label("price", Price.price / Estate.area),
        )
        .where(District.district_name.is_not(None))
        .where(Estate.construction_year.is_not(None))
        .where(Estate.rooms.is_not(None))
        .where(Price.price.is_not(None))
        .join(District)
        .join(Price)
    )
    data = session.exec(stm).mappings().all()
    for d in data:
        models.append(TrainDataDTO(**d))
    return models
