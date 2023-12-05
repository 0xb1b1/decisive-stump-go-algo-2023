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
    prefix="/parser/rbc",
    tags=['RBC', ],
    # dependencies=[Depends(get_token_header)],
    responses={404: {"description": "Not found"}}
)


@router.post(
    '/parse/articles',
    response_model=FetchResponse
)
async def parse_website(
        background_tasks: BackgroundTasks,
        pages: int = 3,
        cooldown_seconds: int = 5,
        ):
    repo = ArticleRepository(database=db)
    parser = RBCInvestmentsParser(
        cooldown_seconds,
        os.getenv("DS_NEWS_PARSER_SELENIUM_DOMAIN"),
        os.getenv("DS_NEWS_PARSER_SELENIUM_PORT"),
        repo,
        max_scroll_count=pages,
    )
    background_tasks.add_task(parser.parse)

    return FetchResponse(is_successful=True)


@router.post(
    "/parse/stocks",
    response_model=FetchResponse
)
async def parse_stocks(
    background_tasks: BackgroundTasks,
):
    repo = StockInfoRepository(database=db)
    article_repo = ArticleRepository(database=db)
    parser = RBCInvestmentsStocksParser(
        os.getenv("DS_NEWS_PARSER_SELENIUM_DOMAIN"),
        os.getenv("DS_NEWS_PARSER_SELENIUM_PORT"),
        repo,
        article_repo
    )
    background_tasks.add_task(parser.parse)

    return FetchResponse(is_successful=True)
