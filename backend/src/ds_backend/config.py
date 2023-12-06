#!/usr/bin/env python3

import os
import sys
from loguru import logger

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


########
if is_run_fatal:
    sys.exit(1)
