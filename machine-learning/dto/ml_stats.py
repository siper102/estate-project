from datetime import datetime

from pydantic import BaseModel


class MlStats(BaseModel):
    tag: str
    trained_at: datetime = datetime.now()
    train_score: float
    test_score: float
    mse_train: float
    in_production: bool
    train_size: int
    test_size: int
    training_time: float
