#!/usr/bin/env python3
from pydantic import BaseModel


class StockInfoParseRequestSchema(BaseModel):
    tickers: list[str]


class StockInfoSchema(BaseModel):
    symbol: str
    company: str | None
    description: str | None
    sector: str | None


class StocksInfoSchema(BaseModel):
    stocks: list[StockInfoSchema]
