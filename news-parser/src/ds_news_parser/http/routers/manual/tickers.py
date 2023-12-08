#!/usr/bin/env python3
import os
from fastapi import APIRouter, BackgroundTasks

from ds_news_parser.models.generic import FetchResponse
from ds_news_parser.models.article import Article
from ds_news_parser.db.repositories.article import ArticleRepository
from ds_news_parser.db.repositories.stock_info import StockInfoRepository
from ds_news_parser.db.database import db
from ds_news_parser.parsers.rbc_investments import RBCInvestmentsParser
from ds_news_parser.parsers.rbc_investments_stocks import RBCInvestmentsStocksParser

# See https://fastapi.tiangolo.com/tutorial/bigger-applications/

router = APIRouter(
    prefix="/manual/tickers",
    tags=["Manual", "Tickers", ],
    # dependencies=[Depends(get_token_header)],
    responses={404: {"description": "Not found"}}
)


@router.post(
    '/parse',
    response_model=FetchResponse
)
def 