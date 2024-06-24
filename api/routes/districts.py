from typing import Sequence

from database.database_manager import get_session
from database.models import District
from fastapi import APIRouter, Depends
from sqlmodel import Session, select

district_router = APIRouter()


@district_router.get("/get-districts")
def get_districts(session: Session = Depends(get_session)) -> Sequence[District]:
    districts = session.exec(select(District)).all()
    return districts


@district_router.get("/names")
def get_district_names(session: Session = Depends(get_session)) -> Sequence[str]:
    district_names = session.exec(select(District.district_name)).all()
    return district_names
