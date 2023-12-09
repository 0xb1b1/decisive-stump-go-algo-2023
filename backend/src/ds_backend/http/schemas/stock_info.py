#!/usr/bin/env python3
from pydantic import BaseModel, Field


class StockInfoParseRequestSchema(BaseModel):
    tickers: list[str]


class StockInfoSchema(BaseModel):
    symbol: str = Field(
        description="Stock ticker. Example: YNDX"
    )

    company: str | None = Field(
        description="Company name. Example: ООО Яндекс"
    )

    description: str | None = Field(
        description="Stock description, parsed. Lang: Russian"
    )

    sector: str | None = Field(
        description="Economics industry name. Lang: Russian. \
Example: Информационные технологии"
    )


class StocksInfoSchema(BaseModel):
    stocks: list[StockInfoSchema]
