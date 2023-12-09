#!/usr/bin/env python3
from fastapi import APIRouter, Security, HTTPException
from fastapi_jwt import JwtAuthorizationCredentials
from loguru import logger
import uuid
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

# from ds_backend.db.repositories.news.article import \
#     ArticleRepository

from ds_backend.db.repositories.news.stock_info import \
    StockInfoRepository

from ds_backend.db.repositories.portfolio import \
    PortfolioRepository

from ds_backend.http.schemas.portfolio import \
    PortfolioSchema, \
    PortfolioStockSchema, \
    PortfolioStrippedSchema, \
    PortfoliosDashboardSchema

from ds_backend.models.portfolio import \
    Portfolio, PortfolioStock


router = APIRouter(
    prefix="/portfolio",
    tags=['Portfolios', ],
    # dependencies=[Depends(get_token_header)],
    responses={404: {"description": "Not found"}}
)

# article_repo = ArticleRepository(database=news_db)
stock_info_repo = StockInfoRepository(database=news_db)
portfolio_repo = PortfolioRepository(database=backend_db)


@router.post(
    "/add_portfolio",
    response_model=PortfolioSchema,
)
def add_portfolio(
    portfolio: PortfolioSchema,
    credentials: JwtAuthorizationCredentials = Security(
        config.jwt_ac,
    ),
):
    portfolio_uuid = str(uuid.uuid4())
    portfolio_owner_email = credentials["email"]

    portfolio.uuid = portfolio_uuid
    portfolio.owner_email = portfolio_owner_email

    portfolio_stocks: list[PortfolioStock] = []
    for stock in portfolio.stocks:
        portfolio_stocks.append(
            PortfolioStock(
                ticker=stock.ticker,
                amount=stock.amount,
                is_paused=stock.is_paused,
                is_disabled=stock.is_disabled,
            )
        )

    portfolio_repo.save(
        Portfolio(
            uuid=portfolio_uuid,
            owner_email=portfolio_owner_email,
            sector=portfolio.sector,
            balance=portfolio.balance,
            stocks=portfolio_stocks,
        )
    )

    db_portfolio = portfolio_repo.find_one_by(
        {"uuid": portfolio_uuid}
    )

    if db_portfolio is None:
        logger.error(
            f"Failed to find added portfolio with UUID {portfolio_uuid} ({portfolio})"  # noqa: E501
        )
        raise HTTPException(
            status_code=500,
            detail="Failed to find the portfolio in the database"
        )

    return portfolio


@router.get(
    "/get_all_portfolios",
    response_model=PortfoliosDashboardSchema,
)
def get_all_portfolios(
    credentials: JwtAuthorizationCredentials = Security(
        config.jwt_ac,
    ),
):
    logger.debug(
        f"User (email: {credentials['email']}, role: {credentials['role']}) \
requested all portfolios"
    )

    portfolios: list[PortfolioStrippedSchema] = []

    cur = portfolio_repo.find_by(
        {"owner_email": credentials["email"]}
    )

    for portfolio in cur:
        portfolios.append(
            PortfolioStrippedSchema(
                uuid=portfolio.uuid,
                sector=portfolio.sector,
                profit="34.12",
            )
        )

    return PortfoliosDashboardSchema(
        stripped_portfolios=portfolios,
    )


@router.get(
    "/get_portfolio",
    response_model=PortfolioSchema,
)
def get_portfolio(
    uuid: str,
    credentials: JwtAuthorizationCredentials = Security(
        config.jwt_ac,
    ),
):
    logger.debug(
        f"User (email: {credentials['email']}, role: {credentials['role']}) \
requested portfolio (UUID: {uuid})"
    )

    # Check if the portfolio belongs to the user
    portfolio = portfolio_repo.find_one_by_id(
        {"uuid": uuid}
    )

    if portfolio is None:
        raise HTTPException(
            status_code=404,
            detail="Portfolio not found"
        )

    if portfolio.owner_email != credentials["email"]:
        raise HTTPException(
            status_code=401,
            detail=f"This portfolio does not delong to user {credentials['email']}"  # noqa: E501
        )

    portfolio_stocks: list[PortfolioStockSchema] = []
    for stock in portfolio.stocks:
        company = stock_info_repo.find_one_by(
            {"symbol": stock.ticker}
        )
        if company is None:
            logger.error(
                f"Stock info not found for ticker {stock.ticker}"
            )
        company = company.company
        portfolio_stocks.append(
            PortfolioStockSchema(
                ticker=stock.ticker,
                company=company,
                profit_daily_percent="0.00",
                amount=stock.amount,
                is_paused=stock.is_paused,
                is_disabled=stock.is_disabled,
            )
        )

    return PortfolioSchema(
        uuid=portfolio.uuid,
        sector=portfolio.sector,
        balance=portfolio.balance,
        profit_weekly_percent="69.420",
        profit="123.45",
        stocks=portfolio_stocks,
    )
