#!/usr/bin/env python3
from pydantic import BaseModel, Field
from pydantic_mongo import ObjectIdField


class PortfolioStock(BaseModel):
    id: ObjectIdField = None
    ticker: str = Field(
        description="Stock ticker. Example: YNDX.",
    )

    amount: int = Field(
        default=0,
        description="Amount of this stock in the portfolio.",
    )

    is_paused: bool = Field(
        default=False,
        description="Stock is frozen (do not sell it)",
    )

    is_disabled: bool = Field(
        default=False,
        description="Stock is disabled (sell everything and do not buy)",
    )


class Portfolio(BaseModel):
    id: ObjectIdField = None
    uuid: str = Field(
        description="Randomly generated identificator",
    )

    owner_email: str = Field(
        description="Owner's email address"
    )

    sector: str = Field(
        description="Portfolio name/sector",
    )

    balance: float = Field(
        default=0.00,
        description="Available money in the portfolio in RUR",
    )

    stocks: list[PortfolioStock] = Field(
        description="List of stocks and portfolio-related values.",
    )


    # class Config:
    #     use_enum_values = True
