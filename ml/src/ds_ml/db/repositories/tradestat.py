from pydantic_mongo import AbstractRepository
from pymongo.database import Database
from pymongo import ASCENDING

from ds_ml.models.tradestat import \
    TradeStat


class TradeStatRepository(AbstractRepository[TradeStat]):
    def __init__(self, database: Database):
        AbstractRepository.__init__(self, database)
        database["tradestats"].create_index("secid", unique=False)
        database["tradestats"].create_index(
            [
                ("year", ASCENDING),
                ("year_row", ASCENDING)
            ],
            unique=True
        )

    class Meta:
        collection_name = "tradestats"
