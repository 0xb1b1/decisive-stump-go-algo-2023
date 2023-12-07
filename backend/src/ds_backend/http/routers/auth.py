#!/usr/bin/env python3
from fastapi import APIRouter, Security, HTTPException
from fastapi_jwt import JwtAuthorizationCredentials
from loguru import logger
from pymongo.errors import DuplicateKeyError

from ds_backend.http.schemas.user import UserBaseSchema, \
    UserResponseSchema, \
    UserSignupSchema, \
    UserLoginSchema
from ds_backend.http.schemas.token import TokenSchema
from ds_backend import config

from ds_backend.db.databases import backend_db
from ds_backend.db.repositories.user import UserRepository
# from ds_backend.models.user import User

from ds_backend.http.utils.user_signup_schema_to_user \
    import user_signup_schema_to_user

# See https://fastapi.tiangolo.com/tutorial/bigger-applications/

router = APIRouter(
    prefix="/auth",
    tags=['Authentication', ],
    # dependencies=[Depends(get_token_header)],
    responses={404: {"description": "Not found"}}
)

repo = UserRepository(database=backend_db)


@router.post(
    "/signup",
    response_model=TokenSchema,
)
async def signup(credentials: UserSignupSchema):
    user = user_signup_schema_to_user(credentials)

    try:
        repo.save(
            user
        )
    except DuplicateKeyError:
        logger.info(
            f"User with email {user.email} already exists."
        )
        raise HTTPException(
            status_code=400,
            detail="User already exists",
        )

    subject = {
        "email": user.email,
        "role": user.role,
    }

    return {
        "access_token": config.jwt_ac.create_access_token(
            subject=subject
        )
    }


@router.post(
    "/login",
    response_model=TokenSchema,
)
async def login(credentials: UserLoginSchema):
    user = repo.find_one_by({"email": credentials.email})
    if user is None:
        raise HTTPException(
            status_code=400,
            detail="Invalid credentials",
        )
    if user.password_hash != credentials.password_hash:
        raise HTTPException(
            status_code=400,
            detail="Invalid credentials",
        )

    subject = {
        "email": user.email,
        "role": user.role,
    }
    return {
        "access_token": config.jwt_ac.create_access_token(
            subject=subject
        )
    }


@router.get(
    "/me"
)
def user(
    credentials: JwtAuthorizationCredentials = Security(
        config.jwt_ac,
    ),
):
    return {
        "email": credentials["email"],
        "role": credentials["role"]
    }
