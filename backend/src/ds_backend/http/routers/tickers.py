#!/usr/bin/env python3
from fastapi import APIRouter, Security, HTTPException
from fastapi_jwt import JwtAuthorizationCredentials
from loguru import logger
from pymongo.errors import DuplicateKeyError
from datetime import datetime
from urllib import parse as urlparse

from ds_backend.http.schemas.stock_info import \
    StockInfoParseRequestSchema, \
    StockInfoSchema, \
    StocksInfoSchema, \
    StockSearchSchema, \
    StockSearchItemSchema
from ds_backend.http.schemas.token import TokenSchema
from ds_backend import config

from ds_backend.db.databases import backend_db, \
    news_db
from ds_backend.db.repositories.news.article import \
    ArticleRepository
from ds_backend.db.repositories.news.stock_info import \
    StockInfoRepository


router = APIRouter(
    prefix="/tickers",
    tags=['Tickers', ],
    # dependencies=[Depends(get_token_header)],
    responses={404: {"description": "Not found"}}
)

article_repo = ArticleRepository(database=news_db)
stock_info_repo = StockInfoRepository(database=news_db)


@router.get(
    "/info",
    response_model=StockInfoSchema,
)
def ticker_info(ticker: str):
    stock_info = stock_info_repo.find_one_by(
        {
            "symbol": ticker.upper(),
        }
    )

    return StockInfoSchema(
        symbol=stock_info.symbol,
        company=stock_info.company,
        description=stock_info.description,
        sector=stock_info.sector,
    )


@router.post(
    "/parse",
    response_model=StocksInfoSchema,
)
def parse_stocks(stocks: StockInfoParseRequestSchema):
    """Gets a list of tickers from user,
    fetches information on them and saves to DB.

    Args:
        stocks (StockInfoParseRequestSchema): List of tickers to parse.
    """
    pass
    # requests.post(
    #     urlparse.urljoin(
    #         config.NEWS_PARSER_BASE_URL,
    #         "",
    #     )
    # )
