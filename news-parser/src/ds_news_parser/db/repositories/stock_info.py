from pydantic_mongo import AbstractRepository
from pymongo.database import Database

from ds_news_parser.models.stock_info import \
    StockInfo


class StockInfoRepository(AbstractRepository[StockInfo]):
    def __init__(self, database: Database):
        AbstractRepository.__init__(self, database)
        database["stocks_info"].create_index("symbol", unique=True)

    class Meta:
        collection_name = "stocks_info"
