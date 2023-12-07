from pydantic_mongo import AbstractRepository
from pymongo.database import Database

from ds_backend.models.user import \
    User


class UserRepository(AbstractRepository[User]):
    def __init__(self, database: Database):
        AbstractRepository.__init__(self, database)
        database["users"].create_index("email", unique=True)

    class Meta:
        collection_name = "users"
