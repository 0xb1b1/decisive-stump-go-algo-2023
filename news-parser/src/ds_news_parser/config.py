#!/usr/bin/env python3

import os

from ds_news_parser.setup import logging, webserver_port

LOGGING_LEVEL: str = logging.validate_logging_level(
    os.getenv("DS_NEWS_PARSER_LOGGING_LEVEL")
)

WEBSERBER_PORT: int = webserver_port.validate_webserver_port(
    os.getenv("DS_NEWS_WEBSERVER_PORT")
)
