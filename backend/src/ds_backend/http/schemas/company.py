#!/usr/bin/env python3
from pydantic import BaseModel, Field
from enum import Enum

from ds_backend.http.schemas.stock_info import \
    StockInfoSchema


class StockActionRecommendation(str, Enum):
    """Suggested stock action.
    """
    BUY = "buy"
    SELL = "sell"
    HOLD = "hold"


class CompanyInfoRequestSchema(BaseModel):
    ticker: str = Field(
        description="Company's stock ticker name. Lang: EN"
    )


class CompanyInfoSchema(BaseModel):
    name: str | None = Field(
        description="Company name. Lang: RU/EN"
    )

    ticker: str = Field(
        description="Company's stock ticker name. Lang: EN"
    )

    sector: str | None = Field(
        description="Economical sector. Lang: RU/EN"
    )

    description: str | None = Field(
        description="Stock description, parsed. Lang: RU"
    )

    prediction: None = Field(
        description="Price prediction. TODO: create model"
    )

    stock_price: float = Field(
        description="Stock price in RUR, double decimal precision"
    )

    recommendation: StockActionRecommendation = Field(
        description="Suggested stock action"
    )

    prognosis_percentage: float = Field(
        description="Price prognosis for the stock"
    )

    portfolio_id: str | None = Field(
        description="Portfolio ID which contains the stock. null if not in portfolio"  # noqa: E501
    )
