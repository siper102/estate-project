from bentoml.sklearn import save_model
from sklearn.ensemble import RandomForestRegressor
from sklearn.pipeline import Pipeline
from sklearn.feature_extraction import DictVectorizer
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
from math import inf
from time import time
import logging

import pandas as pd
from sqlalchemy import create_engine, func
from sqlalchemy.orm import Session
from sqlalchemy.engine.url import URL
from sqlalchemy_utils import create_database, database_exists
from configparser import ConfigParser
from mlstats import Base, MlStats


MODEL_NAME = "estate-regressor"
logger = logging.getLogger(__name__)


def get_engine():
    """
    Create sqlalchemy.engine.Engine for credentials in data/credentials.ini
    """
    parser = ConfigParser()
    parser.read("../data/credentials.ini")

    engine = create_engine(URL.create(**parser["DATABASE"]))
    if not database_exists(engine.url):
        create_database(engine.url)
    # Create Tables if not exist
    Base.metadata.create_all(engine, checkfirst=True)
    return engine


def extract_data(engine):
    """
    Use the engine to extract the estate data from the database
    :param engine: the engine for the database
    :return: pd.DataFrame with the data
    """
    query = """
    SELECT *
    FROM ml_training_data;
    """
    df = pd.read_sql_query(sql=query, con=engine)
    df = df.dropna()
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


def get_latest_model_stats(engine):
    """
    Use the engine to query the mse and tag from the last model
    :param engine: the engine for the database connection
    :return: mse and tag of last model
    """
    with Session(engine) as session:
        max_id = session.query(func.max(MlStats.id)).scalar()
        stat = session.query(MlStats).filter(MlStats.id == max_id).first()
        if stat:
            latest_tag = stat.model_tag
            latest_mse = stat.mse_train
            return latest_mse, latest_tag
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


def persist_stats(stats, engine):
    """
    Save the stats for this training session
    :param stats: Stats ORM object (see mlstats.py)
    :param engine: the engine for the database connection
    """
    with Session(engine) as session:
        session.add(stats)
        session.commit()


if __name__ == "__main__":
    logger.info("creating database connection")
    # Connect to database
    engine = get_engine()

    # extract data from database
    logger.info("connected to database...extract data")
    data = extract_data(engine=engine)

    # transform data and split in test and training data
    logger.info("transform data")
    X_train, X_test, y_train, y_test = transform_data(data)

    # train model with latest data
    start = time()
    model = create_model(X_train, y_train)
    stop = time()
    logger.info(f"model trained...training took {stop - start} seconds")

    # calculate metrics
    train_score, test_score, mse_train = evaluate_model(
        model=model, X_train=X_train, y_train=y_train, X_test=X_test, y_test=y_test
    )
    # Get latest MSE to compare the two models
    latest_mse, model_tag = get_latest_model_stats(engine)

    # If the MSE decreased use the new model in production
    if mse_train < latest_mse:
        saved_model = save_model(name=MODEL_NAME, model=model)
        in_production = True
        model_tag = saved_model.tag
        logger.info(f"New model {saved_model} in production")
    else:
        in_production = False
        logger.info("Old model used in production")

    # Create stats and persist
    stats = MlStats(
        model_tag=model_tag,
        train_score=train_score,
        test_score=train_score,
        mse_train=mse_train,
        in_production=in_production,
        train_size=len(X_train),
        test_size=len(X_test),
        training_time=stop - start,
    )
    persist_stats(stats, engine)
    logger.info("Stats persisted")
