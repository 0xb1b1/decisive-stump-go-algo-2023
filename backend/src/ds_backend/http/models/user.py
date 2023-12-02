#!/usr/bin/env python3
from pydantic import BaseModel
from datetime import datetime


class User(BaseModel):
    id: int
    name: str
    joined: datetime
