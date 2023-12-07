#!/usr/bin/env python3
from fastapi import APIRouter, Security, HTTPException
from fastapi_jwt import JwtAuthorizationCredentials
from loguru import logger
from pymongo.errors import DuplicateKeyError
from datetime import datetime

from ds_backend.http.schemas.news import \
    ArticlesSchema, ArticleSchema
from ds_backend.http.schemas.token import TokenSchema
from ds_backend import config

from ds_backend.db.databases import backend_db
from ds_backend.db.repositories.news.article import \
    ArticleRepository
from ds_backend.db.repositories.news.stock_info import \
    StockInfoRepository
# from ds_backend.models.user import User

from ds_backend.http.utils.user_signup_schema_to_user \
    import user_signup_schema_to_user

# See https://fastapi.tiangolo.com/tutorial/bigger-applications/

router = APIRouter(
    prefix="/news",
    tags=['News', ],
    # dependencies=[Depends(get_token_header)],
    responses={404: {"description": "Not found"}}
)

article_repo = ArticleRepository(database=backend_db)
stock_info_repo = StockInfoRepository(database=backend_db)


@router.get(
    "/get",
    response_model=ArticlesSchema,
)
def get_articles(
    from_timestamp: datetime | None = None,
    to_timestamp: datetime | None = None,
):
    is_from_timestamp = True
    is_to_timestamp = True
    if from_timestamp is None:
        from_timestamp = datetime(1970, 1, 1, 0, 0, 0)
        is_from_timestamp = False
    if to_timestamp is None:
        to_timestamp = datetime(1970, 1, 1, 0, 0, 0)
        is_to_timestamp = False
    logger.debug(
        f"Getting articles from DB; from: {from_timestamp}, to: {to_timestamp}"
    )

    articles: list[ArticleSchema] = []
    for article in article_repo.find_by(
        {
            "timestamp": {
                "$gte": from_timestamp,
                "$lt": to_timestamp,
            }
        }
    ):
        article_schema = ArticleSchema(
            title=article.title,
            tldr=article.tldr,
            link=article.link,
            timestamp=article.timestamp,
            stocks=article.stocks,
            tags=article.tags,
        )
        articles.append(article_schema)

    return ArticlesSchema(
        articles=articles,
        from_timestamp=from_timestamp if is_from_timestamp else None,
        to_timestamp=to_timestamp if is_to_timestamp else None,
    )
