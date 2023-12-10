#!/usr/bin/env python3
from fastapi import APIRouter, Security, HTTPException
from fastapi_jwt import JwtAuthorizationCredentials
from loguru import logger
import bcrypt
import uuid
from pymongo.errors import DuplicateKeyError

from ds_backend.http.schemas.user import UserSignupSchema, \
    UserLoginSchema, UserInfoSchema

from ds_backend.http.schemas.token import TokenSchema

from ds_backend import config

from ds_backend.db.databases import backend_db

from ds_backend.db.repositories.user import \
    UserRepository

from ds_backend.db.repositories.portfolio import \
    PortfolioRepository

from ds_backend.models.portfolio import \
    Portfolio, PortfolioStock

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
portfolio_repo = PortfolioRepository(database=backend_db)


@router.post(
    "/signup",
    response_model=TokenSchema,
)
async def signup(credentials: UserSignupSchema):
    logger.debug(
        f"A user tries to sign up (email: {credentials.email})")
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

    # Add demo portfolios
    portfolio_repo.save_many(
        [
            Portfolio(
                uuid=str(uuid.uuid4()),
                owner_email=credentials.email,
                sector="Информационные технологии",
                balance=float(125447.12),
                stocks=[
                    PortfolioStock(
                        ticker="YNDX",
                        amount=12,
                        is_paused=False,
                        is_disabled=False,
                    ),
                    PortfolioStock(
                        ticker="CIAN",
                        amount=36,
                        is_paused=False,
                        is_disabled=False,
                    ),
                    PortfolioStock(
                        ticker="QIWI",
                        amount=0,
                        is_paused=False,
                        is_disabled=True,
                    ),
                    PortfolioStock(
                        ticker="ASTR",
                        amount=6,
                        is_paused=True,
                        is_disabled=False,
                    ),
                    PortfolioStock(
                        ticker="VKCO",
                        amount=30,
                        is_paused=False,
                        is_disabled=True,
                    ),
                ],
            ),

            Portfolio(
                uuid=str(uuid.uuid4()),
                owner_email=credentials.email,
                sector="Телекоммуникации",
                balance=float(41217.75),
                stocks=[
                    PortfolioStock(
                        ticker="MTSS",
                        amount=57,
                        is_paused=False,
                        is_disabled=False,
                    ),
                    PortfolioStock(
                        ticker="700",
                        amount=80,
                        is_paused=True,
                        is_disabled=False,
                    ),
                    PortfolioStock(
                        ticker="BIDU",
                        amount=0,
                        is_paused=False,
                        is_disabled=True,
                    ),
                    PortfolioStock(
                        ticker="RTKM",
                        amount=79,
                        is_paused=False,
                        is_disabled=False,
                    ),
                ],
            ),

            Portfolio(
                uuid=str(uuid.uuid4()),
                owner_email=credentials.email,
                sector="Энергетика",
                balance=float(217554.04),
                stocks=[
                    PortfolioStock(
                        ticker="GAZP",
                        amount=172,
                        is_paused=False,
                        is_disabled=False,
                    ),
                    PortfolioStock(
                        ticker="TATNP",
                        amount=2,
                        is_paused=False,
                        is_disabled=False,
                    ),
                    PortfolioStock(
                        ticker="LKOH",
                        amount=5,
                        is_paused=False,
                        is_disabled=False,
                    ),
                    PortfolioStock(
                        ticker="SNGS",
                        amount=351,
                        is_paused=True,
                        is_disabled=False,
                    ),
                ],
            ),
        ]
    )

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
    logger.debug(
        f"A user tries to sign in (email: {credentials.email})"
    )
    user = repo.find_one_by({"email": credentials.email})
    if user is None:
        raise HTTPException(
            status_code=400,
            detail="Invalid credentials",
        )

    # Check BCrypt hash
    is_password_correct = bcrypt.checkpw(
        credentials.password.encode("utf-8"),
        user.password_hash.encode("utf-8"),
    )

    if not is_password_correct:
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
    "/me",
    response_model=UserInfoSchema,
)
def user(
    credentials: JwtAuthorizationCredentials = Security(
        config.jwt_ac,
    ),
):
    return UserInfoSchema(
        email=credentials["email"],
        role=credentials["role"],
    )
