from pydantic_mongo import AbstractRepository
from pymongo.database import Database

from ds_news_parser.models.article import \
    Article


class ArticleRepository(AbstractRepository[Article]):
    def __init__(self, database: Database):
        AbstractRepository.__init__(self, database)
        database["articles"].create_index("title", unique=True)

    class Meta:
        collection_name = "articles"
