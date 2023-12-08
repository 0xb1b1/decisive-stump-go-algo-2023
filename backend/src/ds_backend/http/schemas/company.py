#!/usr/bin/env python3
from pydantic import BaseModel


class CompanyInfo(BaseModel):
    symbol: str
    name: str | None
    description: str | None
    sector: str | None
