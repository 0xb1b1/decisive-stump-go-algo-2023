#!/usr/bin/env python3
from pydantic import BaseModel
from pydantic_mongo import ObjectIdField
from datetime import datetime


class Stock(BaseModel):
    symbol: str
    link: str


class Tag(BaseModel):
    name: str
    link: str


class Article(BaseModel):
    id: ObjectIdField = None
    title: str
    tldr: str
    link: str
    timestamp: datetime | None
    stocks: list[Stock] = []
    tags: list[Tag] = []
