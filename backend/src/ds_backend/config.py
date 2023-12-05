#!/usr/bin/env python3

import os

from ds_backend.setup import logging, webserver_port

LOGGING_LEVEL: str = logging.validate_logging_level(
    os.getenv("DS_BACKEND_LOGGING_LEVEL")
)

WEBSERVER_PORT, IS_WEBSERVER_PORT_DEFAULT = webserver_port.validate_webserver_port(  # noqa: E501
    os.getenv("DS_BACKEND_WEBSERVER_PORT")
)
