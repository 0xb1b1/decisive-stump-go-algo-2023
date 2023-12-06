from pymongo import MongoClient
from pymongo.database import Database

from ds_backend import config

__all__ = (
    "client",
    "backend_db",
    "news_db"
)

client = MongoClient(config.MONGO_URL)

news_db: Database = (
    client[config.MONGO_NEWS_DB]
)

backend_db: Database = (
    client[config.MONGO_BACKEND_DB]
)
