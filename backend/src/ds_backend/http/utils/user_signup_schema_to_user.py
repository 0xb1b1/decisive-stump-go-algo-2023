#!/usr/bin/env python3
from datetime import datetime

from ds_backend.http.schemas.user import UserSignupSchema
from ds_backend.models.user import User


def user_signup_schema_to_user(
    schema: UserSignupSchema
) -> User:
    return User(
        email=schema.email,
        password_hash=schema.password_hash,
        role="user",
        first_name=schema.first_name,
        last_name=schema.last_name,
        created_at=datetime.utcnow(),
        updated_at=datetime.utcnow(),
    )