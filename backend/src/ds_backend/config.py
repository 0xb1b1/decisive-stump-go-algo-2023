#!/usr/bin/env python3

import os
import sys
from loguru import logger
from fastapi_jwt import JwtAccessBearer
from datetime import timedelta

from ds_backend.setup import logging, webserver_port

is_run_fatal = False

LOGGING_LEVEL: str = logging.validate_logging_level(
    os.getenv("DS_BACKEND_LOGGING_LEVEL")
)

WEBSERVER_HOST: str = os.getenv(
    "DS_NEWS_PARSER_WEBSERVER_HOST",
    "0.0.0.0"
)

WEBSERVER_PORT, IS_WEBSERVER_PORT_DEFAULT = webserver_port.validate_webserver_port(  # noqa: E501
    os.getenv("DS_BACKEND_WEBSERVER_PORT")
)

MONGO_URL: str = os.getenv("DS_BACKEND_MONGO_URL", "")
if MONGO_URL == "":
    logger.critical("MongoDB URL is not specified.")
    is_run_fatal = True

MONGO_NEWS_DB: str = os.getenv("DS_BACKEND_MONGO_NEWS_DB", "")
if MONGO_NEWS_DB == "":
    logger.critical("MongoDB News (news-parser) Database is not specified.")
    is_run_fatal = True

MONGO_BACKEND_DB: str = os.getenv("DS_BACKEND_MONGO_BACKEND_DB", "")
if MONGO_NEWS_DB == "":
    logger.critical("MongoDB Backend Database is not specified.")
    is_run_fatal = True

# Authentication (oauth2//jwt)
JWT_SECRET_KEY = os.getenv("DS_BACKEND_JWT_SECRET_KEY", "")
JWT_ACCESS_EXPIRATION_MINUTES = int(
    os.getenv(
        "DS_BACKEND_JWT_ACCESS_EXPIRATION_MINUTES",
        "30",
    )
)

if JWT_SECRET_KEY == "":
    logger.critical("JWT Secret key is not specified.")
    is_run_fatal = True

jwt_ac = JwtAccessBearer(
    secret_key=JWT_SECRET_KEY,
    auto_error=True,
    access_expires_delta=timedelta(JWT_ACCESS_EXPIRATION_MINUTES),
)

# Local services
NEWS_PARSER_BASE_URL = os.getenv(
    "DS_BACKEND_NEWS_PARSER_BASE_URL", "news-parser"
)


########
if is_run_fatal:
    sys.exit(1)
