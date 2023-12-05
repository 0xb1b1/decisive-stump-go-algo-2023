#!/usr/bin/env python3

import os
import sys
from loguru import logger

from ds_news_parser.setup import logging, webserver_port

is_run_fatal: bool = False

LOGGING_LEVEL: str = logging.validate_logging_level(
    os.getenv("DS_NEWS_PARSER_LOGGING_LEVEL")
)

WEBSERVER_HOST: str = os.getenv(
    "DS_NEWS_PARSER_WEBSERVER_HOST",
    "0.0.0.0"
)

WEBSERVER_PORT, IS_WEBSERVER_PORT_DEFAULT = webserver_port.validate_webserver_port(  # noqa: E501
    os.getenv("DS_NEWS_PARSER_WEBSERVER_PORT")
)

MONGO_URL: str = os.getenv("DS_NEWS_PARSER_MONGO_URL", "")
if MONGO_URL == "":
    logger.critical("MongoDB URL is not specified.")
    is_run_fatal = True

MONGO_DB: str = os.getenv("DS_NEWS_PARSER_MONGO_DB", "")
if MONGO_DB == "":
    logger.critical("MongoDB Database is not specified.")
    is_run_fatal = True

# MONGO_COLLECTION: str = os.getenv("DS_NEWS_PARSER_MONGO_COLLECTION", "")
# if MONGO_COLLECTION == "":
#     logger.fatal("MongoDB Collection is not specified.")


########
if is_run_fatal:
    sys.exit(1)
