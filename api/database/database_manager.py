from csv import DictReader
from os import getenv

from database.models import AccessType, ApiUser, District, SQLModel
from sqlmodel import Session, create_engine, select

url = "postgresql+psycopg2://{user}:{password}@{host}/{database}"
engine = create_engine(
    url.format(
        user=getenv("PGUSER", "estates_scraper"),
        password=getenv("PGPASSWORD", "password123"),
        host=getenv("PGHOST", "localhost"),
        database=getenv("PGDATABASE", "estates"),
    )
)


def get_session():
    with Session(engine) as session:
        yield session


def setup_database():
    _create_db_and_tables()
    inserted_districts = _get_inserted_districts()
    _insert_districts(inserted_districts=inserted_districts)
    _insert_api_users()


def get_user_by_api_key(api_key: str) -> ApiUser:
    with Session(engine) as session:
        stm = select(ApiUser).where(ApiUser.api_key == api_key)
        user = session.exec(stm).first()
        return user


def _insert_api_users():
    scraper_user = ApiUser(
        api_key="scraper_api_key", username="scraper", role=AccessType.SCRAPER_ACCESS
    )
    ml_user = ApiUser(
        api_key="ml_api_key", username="bentoml", role=AccessType.ML_ACCESS
    )
    ui_user = ApiUser(
        api_key="ui_api_key", username="streamlit", role=AccessType.UI_ACCESS
    )
    admin_user = ApiUser(
        api_key="admin_api_key", username="admin", role=AccessType.ADMIN
    )
    with Session(engine) as session:
        existing_user_names = session.exec(select(ApiUser.username)).all()
        new_users = []
        for user in [scraper_user, ml_user, ui_user, admin_user]:
            if user.username not in existing_user_names:
                new_users.append(user)
        session.add_all(new_users)
        session.commit()


def _create_db_and_tables():
    SQLModel.metadata.create_all(engine)


def _insert_districts(inserted_districts):
    districts = []
    with open("data/district.csv", "r") as f:
        csv_reader = DictReader(f)
        for row in csv_reader:
            if int(row.get("district_number")) not in inserted_districts:
                districts.append(District(**row))
    with Session(engine) as session:
        session.add_all(districts)
        session.commit()


def _get_inserted_districts():
    with Session(engine) as session:
        inserted_districts = session.exec(select(District.district_number)).all()
        return inserted_districts
