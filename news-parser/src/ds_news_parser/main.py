#!/usr/bin/env python3
from fastapi import FastAPI
from loguru import logger
import uvicorn
import sys

from ds_news_parser import config


def run() -> None:
    # Set up Loguru
    logger.remove()
    logger.add(sys.stderr, level=config.LOGGING_LEVEL)
    logger.info(f"Logging level set to {config.LOGGING_LEVEL}")

    # from ds_news_parser.http.routers.user import router as user_router

    app = FastAPI()
    # app.include_router(user_router)

    logger.info(f"Starting FastAPI on port {config.WEBSERVER_PORT}.")
    if config.IS_WEBSERVER_PORT_DEFAULT:
        logger.warning("Running webserver on standard port.")
    uvicorn.run(
        app,
        port=config.WEBSERVER_PORT
    )


if __name__ == "__main__":
    run()
