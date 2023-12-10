from pymongo import MongoClient
from pymongo.database import Database

from ds_ml import config

__all__ = (
    "client",
    "ml_db",
)

client = MongoClient(config.MONGO_URL)

ml_db: Database = (
    client[config.MONGO_ML_DB]
)
