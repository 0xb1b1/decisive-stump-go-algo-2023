from pydantic_mongo import AbstractRepository
from pymongo.database import Database
from pymongo import ASCENDING

from ds_backend.models.portfolio import \
    Portfolio


class PortfolioRepository(AbstractRepository[Portfolio]):
    def __init__(self, database: Database):
        AbstractRepository.__init__(self, database)

        # UUIDs should be unique
        database["portfolios"].create_index("uuid", unique=True)

        # Only one portfolio in one sector inside a user's account
        database["portfolios"].create_index(
            [
                ("owner_email", ASCENDING),
                ("sector", ASCENDING)
            ],
            unique=True
        )

    class Meta:
        collection_name = "portfolios"
