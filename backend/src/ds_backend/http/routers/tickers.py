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

from ds_backend.db.databases import backend_db, \
    news_db
from ds_backend.db.repositories.news.article import \
    ArticleRepository
from ds_backend.db.repositories.news.stock_info import \
    StockInfoRepository


router = APIRouter(
    prefix="/news",
    tags=['News', ],
    # dependencies=[Depends(get_token_header)],
    responses={404: {"description": "Not found"}}
)

article_repo = ArticleRepository(database=news_db)
stock_info_repo = StockInfoRepository(database=news_db)
