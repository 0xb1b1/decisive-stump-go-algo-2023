from pydantic_mongo import AbstractRepository
from pymongo.database import Database

from ds_backend.models.portfolio import \
    Portfolio


class PortfolioRepository(AbstractRepository[Portfolio]):
    def __init__(self, database: Database):
        AbstractRepository.__init__(self, database)
        database["portfolios"].create_index("uuid", unique=True)
        # TODO: Create index on owner+category?

    class Meta:
        collection_name = "portfolios"
