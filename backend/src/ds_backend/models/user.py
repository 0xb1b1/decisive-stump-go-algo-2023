#!/usr/bin/env python3
from pydantic import BaseModel, EmailStr
from datetime import datetime
from pydantic_mongo import ObjectIdField


class User(BaseModel):
    id: ObjectIdField = None
    email: EmailStr
    password_hash: str
    role: str
    first_name: str
    last_name: str | None = None
    created_at: datetime | None = None
    updated_at: datetime | None = None
