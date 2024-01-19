from sqlalchemy import (
    BigInteger,
    Column,
    DateTime,
    String,
    Integer,
    Float,
    Boolean
)
from sqlalchemy.orm import declarative_base
from datetime import datetime

Base = declarative_base()


class MlStats(Base):
    __tablename__ = "ml_stats"

    id = Column(BigInteger, primary_key=True, autoincrement=True)
    model_tag = Column(String(40))
    trained_at = Column(DateTime, default=datetime.now())
    train_score = Column(Float)
    test_score = Column(Float)
    mse_train = Column(Float)
    in_production = Column(Boolean)
    train_size = Column(Integer)
    test_size = Column(Integer)
    training_time = Column(Float)
