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

    from ds_news_parser.http.routers.rbc import router as rbc_router

    app = FastAPI()
    app.include_router(rbc_router)

    logger.info(f"Starting FastAPI on host {config.WEBSERVER_HOST}, port {config.WEBSERVER_PORT}.")  # noqa: E501
    if config.IS_WEBSERVER_PORT_DEFAULT:
        logger.warning("Running webserver on standard port.")
    uvicorn.run(
        app,
        host=config.WEBSERVER_HOST,
        port=config.WEBSERVER_PORT,
    )


if __name__ == "__main__":
    run()
