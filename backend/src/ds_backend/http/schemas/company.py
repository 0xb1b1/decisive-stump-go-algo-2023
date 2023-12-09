#!/usr/bin/env python3
from pydantic import BaseModel, Field
from enum import Enum
from decimal import Decimal

# from ds_backend.http.schemas.stock_info import \
#     StockInfoSchema
from ds_backend.http.constants.stock_action_recommendation_colors import \
    StockActionRecommendationColor


class StockActionRecommendationEnum(str, Enum):
    """Suggested stock action.
    """
    BUY = "Покупать"
    SELL = "Продавать"
    HOLD = "Удерживать"


# class CompanyInfoRequestSchema(BaseModel):
#     ticker: str = Field(
#         description="Company's stock ticker name. Lang: EN"
#     )


class StockActionRecommendation(BaseModel):
    recommendation: StockActionRecommendationEnum = Field(
        description="Suggested stock action. Language: RU"
    )

    color: StockActionRecommendationColor = Field(
        description="Stock action hex color"
    )  # Use enum in http.constants.stock_recommendation_colors to get color


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

    stock_price: Decimal = Field(
        description="Stock price in RUR, double decimal precision"
    )

    recommendation: StockActionRecommendation = Field(
        description="Suggested stock action"
    )

    prognosis_percentage: Decimal = Field(
        description="Price prognosis for the stock"
    )

    portfolio_id: str | None = Field(
        description="Portfolio ID which contains the stock. null if not in portfolio"  # noqa: E501
    )
