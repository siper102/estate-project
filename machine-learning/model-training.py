import logging
from math import inf
from os import getenv
from time import time

import pandas as pd
import requests
from bentoml.sklearn import save_model
from dto.ml_stats import MlStats
from requests import get
from sklearn.ensemble import RandomForestRegressor
from sklearn.feature_extraction import DictVectorizer
from sklearn.metrics import mean_squared_error
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline

MODEL_NAME = "estate-regressor"
API_HOST = getenv("API_HOST", "localhost")
API_PORT = getenv("API_PORT", 8000)
API_KEY = getenv("ML_API_KEY", "ml_api_key")

logger = logging.getLogger(__name__)


def extract_data() -> pd.DataFrame:
    """
    Extract train data from Rest Api
    :return: pd.DataFrame with the data
    """
    r = get(
        url=f"http://{API_HOST}:{API_PORT}/ml/train-data",
        headers={"x-api-key": API_KEY},
    )
    df = pd.read_json(r.text)
    return df


def transform_data(data: pd.DataFrame):
    """
    Extract the feature variables and convert to dict and extract the target variable.
    Then split the dataset in test and training data
    :param data: pd.DataFrame with the whole dataset
    :return: test and train data split in feature and target variable
    """
    X = data.drop("price", axis=1).to_dict("records")
    y = data.price
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)
    return X_train, X_test, y_train, y_test


def create_model(X: list, y: pd.Series) -> Pipeline:
    """
    Create the Model pipeline, train it and return.
    The DictVectorizer converts string rows to dummy varioables (here district name)
    :param X: The feature variables
    :param y: The target variables
    :return: The fitted model
    """
    pipeline = Pipeline(
        [("transformer", DictVectorizer()), ("forrest", RandomForestRegressor())]
    )
    pipeline.fit(X=X, y=y)
    return pipeline


def get_latest_model_stats():
    """
    Use the engine to query the mse and tag from the last model
    :return: mse and tag of last model
    """
    r = requests.get(
        url=f"http://{API_HOST}:{API_PORT}/ml/ml-stats",
        params={"last_n": 1},
        headers={"x-api-key": API_KEY},
    )
    stat = r.json()
    if len(stat) > 0:
        latest_tag = stat[0].get("model_tag")
        latest_mse = stat[0].get("mse_train")
        return latest_mse, latest_tag
    else:
        return inf, None


def evaluate_model(model, X_train, y_train, X_test, y_test):
    """
    Calculate the R^{2} score for training and test data and the MSE
    for test data
    :param model: The current used model
    :param X_train: feature variables from training set
    :param y_train: target variables from training set
    :param X_test: feature variables from test set
    :param y_test: target variables from test set
    :return: R^{2} scores and MSE
    """
    train_score = model.score(X_train, y_train)
    test_score = model.score(X_test, y_test)
    y_pred = model.predict(X_test)
    mse_train = mean_squared_error(y_pred, y_test, squared=False)
    return train_score, test_score, mse_train


def persist_stats(stats: MlStats):
    """
    Save the stats for this training session
    :param stats: Stats DTO object (see mlstats.py)
    """
    requests.post(
        url=f"http://{API_HOST}:{API_PORT}/ml/ml-stats",
        data=stats.model_dump_json(),
        headers={"x-api-key": API_KEY},
    )


if __name__ == "__main__":
    # extract data from database
    logger.info("connected to database...extract data")
    data = extract_data()

    # transform data and split in test and training data
    print("transform data")
    X_train, X_test, y_train, y_test = transform_data(data)

    # train model with latest data
    start = time()
    model = create_model(X_train, y_train)
    stop = time()
    print(f"model trained...training took {stop - start} seconds")

    # calculate metrics
    train_score, test_score, mse_train = evaluate_model(
        model=model, X_train=X_train, y_train=y_train, X_test=X_test, y_test=y_test
    )
    # Get latest MSE to compare the two models
    latest_mse, model_tag = get_latest_model_stats()

    # If the MSE decreased use the new model in production
    if mse_train < latest_mse:
        saved_model = save_model(name=MODEL_NAME, model=model)
        in_production = True
        model_tag = saved_model.tag
        print(f"New model {saved_model} in production")
    else:
        in_production = False
        print("Old model used in production")

    # Create stats and persist
    ml_stats = MlStats(
        model_tag=str(model_tag),
        train_score=train_score,
        test_score=train_score,
        mse_train=mse_train,
        in_production=in_production,
        train_size=len(X_train),
        test_size=len(X_test),
        training_time=stop - start,
    )
    persist_stats(ml_stats)
    logger.info("Stats persisted")
