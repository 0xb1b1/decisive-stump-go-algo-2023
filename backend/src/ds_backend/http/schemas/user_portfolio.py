#!/usr/bin/env python3
from pydantic import BaseModel, Field
# from enum import Enum


class PortfolioStockSchema(BaseModel):
    ticker: str = Field(
        description="Stock ticker. Example: YNDX.",
    )

    amount: int = Field(
        default=0,
        description="Amount of this stock in the portfolio.",
    )

    is_paused: bool = Field(
        default=False,
        description="TODO",
    )

    is_disabled: bool = Field(
        default=False,
        description="TODO",
    )


class PortfolioSchema(BaseModel):
    id: str = Field(
        description="Randomly generated identificator"
    )

    sector: str = Field(
        description="Portfolio name/sector"
    )

    balance: float = Field(
        default=0.0,
        description="Available money in the portfolio"
    )

    # class Config:
    #     use_enum_values = True
