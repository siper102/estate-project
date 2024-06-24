from database.database_manager import setup_database
from fastapi import FastAPI
from routes.districts import district_router
from routes.ml import ml_router
from routes.scraper import scraper_router
from routes.user_interface import ui_router

app = FastAPI()

app.include_router(
    ml_router,
    prefix="/ml",
    tags=["Machine Learning Endpoints"],
)
app.include_router(district_router, prefix="/districts", tags=["District Endpoints"])
app.include_router(scraper_router, prefix="/scraper", tags=["Scraper Endpoints"])
app.include_router(ui_router, prefix="/ui", tags=["User Interface Endpoints"])


@app.on_event("startup")
def on_startup():
    setup_database()


@app.get("/health")
def get_health():
    return "OK"
