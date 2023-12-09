#!/usr/bin/env python3
from typing import Annotated
from fastapi import APIRouter, Security, HTTPException, Path
from fastapi_jwt import JwtAuthorizationCredentials
from loguru import logger
import re
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

from ds_backend.http.schemas.company import \
    CompanyInfoSchema, \
    StockActionRecommendationEnum

from ds_backend.http.utils.generate_stock_action_recommendation import \
    gen_action_recommendation


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
def company_info(
    ticker: Annotated[
        str,
        Path(
            title="Stock ticker. Example: YNDX",
        )
    ]
):
    stock = stock_info_repo.find_one_by(
        {"symbol": ticker}
    )
    recommendation = StockActionRecommendationEnum.BUY

    return CompanyInfoSchema(  # TODO: remove hard-coding
        name=stock.company,
        ticker=stock.symbol,
        sector=stock.sector,
        description=stock.description,
        prediction=None,
        stock_price=str(1337.1234),
        recommendation=gen_action_recommendation(recommendation),
        prognosis_percentage=str(123.01),
        portfolio_id="abcdefefwuifevuwifbn932409041",
    )


@router.get(
    "/search",
    response_model=StockSearchSchema,
)
def company_search(query: str):
    reg = re.compile(
        f".*{query}.*",
        re.IGNORECASE,
    )
    cur = stock_info_repo.find_by(
        {
            "$or": [
                {"symbol": reg},
                {"company": reg},
            ]
        }
    )

    stock_search_items: list[StockSearchItemSchema] = []
    for stock in cur:
        stock_search_items.append(
            StockSearchItemSchema(
                ticker=stock.symbol,
                company=stock.company,
            )
        )
    return StockSearchSchema(
        items=stock_search_items
    )
