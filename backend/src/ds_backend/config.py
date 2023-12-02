#!/usr/bin/env python3

import os
import sys
import logger

from ds_backend.setup import logging

LOGGING_LEVEL: str = logging.validate_logging_level(
    os.getenv("DS_BACKEND_LOGGING_LEVEL")
)

logger.add(sys.stderr, level=LOGGING_LEVEL)
