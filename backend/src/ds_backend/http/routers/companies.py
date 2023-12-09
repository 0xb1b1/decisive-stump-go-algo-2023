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
    StocksInfoSchema
from ds_backend.http.schemas.token import TokenSchema
from ds_backend import config

from ds_backend.db.databases import backend_db, \
    news_db
from ds_backend.db.repositories.news.article import \
    ArticleRepository
from ds_backend.db.repositories.news.stock_info import \
    StockInfoRepository
from ds_backend.http.schemas.company import \
    CompanyInfoSchema, \
    StockActionRecommendation


router = APIRouter(
    prefix="/company",
    tags=['Company', ],
    # dependencies=[Depends(get_token_header)],
    responses={404: {"description": "Not found"}}
)

article_repo = ArticleRepository(database=news_db)
stock_info_repo = StockInfoRepository(database=news_db)


@router.get(
    "/info",
    response_model=CompanyInfoSchema,
)
def company_info(ticker: str):
    stock = stock_info_repo.find_one_by(
        {"symbol": ticker}
    )

    return CompanyInfoSchema(  # TODO: remove hard-coding
        name=stock.company,
        ticker=stock.symbol,
        sector=stock.sector,
        description=stock.description,
        prediction=None,
        stock_price=1337.1234,
        recommendation=StockActionRecommendation.BUY,
        prognosis_percentage=123.01,
        portfolio_id="abcdefefwuifevuwifbn932409041",
    )
