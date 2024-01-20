from sqlalchemy import BigInteger, Column, DateTime, Float, ForeignKey, Integer, String
from sqlalchemy.orm import declarative_base, relationship

Base = declarative_base()


class ScraperStats(Base):
    __tablename__ = "scraper_stats"

    id = Column(BigInteger, primary_key=True, autoincrement=True)
    crawl_started = Column(DateTime, nullable=False)
    crawl_ended = Column(DateTime, nullable=False)
    crawler_name = Column(String(60), nullable=False)
    time_elapsed = Column(BigInteger, nullable=False)
    number_requests = Column(Integer)
    number_response = Column(Integer)
    number_response_200 = Column(Integer)
    finished_reason = Column(String(50))
    items_scraped = Column(BigInteger)


class Estate(Base):
    __tablename__ = "estate"

    estate_id = Column(String(50), primary_key=True)
    link = Column(String(255), nullable=False)
    area = Column(Float)
    rooms = Column(Float)
    display_name = Column(String(255), nullable=False)
    location = Column(Integer)
    postal_code = Column(String(5))
    street = Column(String(50))
    lat = Column(Float)
    lon = Column(Float)
    construction_year = Column(Integer)

    price = relationship("Price")


class Price(Base):
    __tablename__ = "price"
    price = Column(Float, nullable=False)
    scraped_at = Column(DateTime, primary_key=True)
    source = Column(String(50), nullable=False)
    estate_id = Column(String(50), ForeignKey(Estate.estate_id), primary_key=True)
