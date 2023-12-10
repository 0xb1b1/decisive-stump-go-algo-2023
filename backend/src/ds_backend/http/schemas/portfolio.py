#!/usr/bin/env python3
from pydantic import BaseModel, Field
# from enum import Enum


class PortfolioStrippedSchema(BaseModel):
    uuid: str = Field(
        description="Randomly generated identificator",
    )

    sector: str = Field(
        description="Portfolio name/sector",
    )

    profit: str = Field(
        default="0.00",
        description="Overall profit value in RUR. Can be negative",
    )


class PortfoliosDashboardSchema(BaseModel):
    stripped_portfolios: list[PortfolioStrippedSchema] = Field(
        description="List of stripped portfolios (for smol components)",
    )


class PortfolioStockSchema(BaseModel):
    ticker: str = Field(
        description="Stock ticker. Example: YNDX.",
    )

    company: str = Field(
        description="Company name. Lang: RU/EN",
    )

    profit_daily_percent: str = Field(
        default="0.000",
        description="Daily profit in decimal percents. Can be negative",
    )

    amount: int = Field(
        default=0,
        description="Amount of this stock in the portfolio.",
    )

    price_per_share: str = Field(
        default="0.00",
        description="Price of one share in RUR",
    )

    price_sum: str = Field(
        default="0.00",
        description="Price of all purchased instances of the share in RUR",
    )

    is_paused: bool = Field(
        default=False,
        description="Stock is frozen (do not sell it)",
    )

    is_disabled: bool = Field(
        default=False,
        description="Stock is disabled (sell everything and do not buy)",
    )


class PortfolioSchema(BaseModel):
    uuid: str = Field(
        description="Randomly generated identificator",
    )

    sector: str = Field(
        description="Portfolio name/sector",
    )

    balance: str = Field(
        default="0.00",
        description="Available money in the portfolio in RUR",
    )

    profit_weekly_percent: str = Field(
        default="0.00",
        description="This week's profit value in RUR. Can be negative",
    )

    profit: str = Field(
        default="0.00",
        description="Overall profit value in RUR. Can be negative",
    )

    stocks: list[PortfolioStockSchema] = Field(
        description="List of stocks and portfolio-related values.",
    )

    # class Config:
    #     use_enum_values = True
