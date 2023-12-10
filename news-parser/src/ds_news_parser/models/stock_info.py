#!/usr/bin/env python3
from pydantic import BaseModel
from pydantic_mongo import ObjectIdField


class StockInfo(BaseModel):
    id: ObjectIdField = None
    symbol: str
    company: str | None
    description: str | None
    sector: str | None
