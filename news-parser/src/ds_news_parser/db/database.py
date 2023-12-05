from pymongo import MongoClient
from pymongo.database import Database
from pymongo.errors import DuplicateKeyError

from ds_news_parser import config

__all__ = (
    "client",
    "db"
)

client = MongoClient(config.MONGO_URL)
db: Database = (
    client[config.MONGO_DB]
)
