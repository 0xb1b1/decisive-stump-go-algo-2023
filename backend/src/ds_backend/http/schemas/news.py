#!/usr/bin/env python3
from pydantic import BaseModel
from datetime import datetime

from ds_backend.models.article import \
    Tag, Stock


class ArticleSchema(BaseModel):
    title: str
    source: str
    tldr: str
    link: str
    timestamp: datetime | None
    stocks: list[Stock] = []
    tags: list[Tag] = []


class ArticlesSchema(BaseModel):
    articles: list[ArticleSchema]
    from_timestamp: datetime | None
    to_timestamp: datetime | None
