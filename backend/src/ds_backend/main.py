#!/usr/bin/env python3
from fastapi import FastAPI
from loguru import logger
import uvicorn
import sys

from ds_backend import config


def run() -> None:
    # Set up Loguru
    logger.remove()
    logger.add(sys.stderr, level=config.LOGGING_LEVEL)
    logger.critical(f"Logging level set to {config.LOGGING_LEVEL}.")
    import sentry_sdk
    sentry_sdk.init("https://3e8060004e03414babfd8abeaba61be3@glitchtip.seizure.icu/1")
    logger.info("Initialized Sentry.")

    from ds_backend.http.routers.auth import router as auth_router
    from ds_backend.http.routers.news import router as news_router

    app = FastAPI()
    app.include_router(auth_router)
    app.include_router(news_router)

    logger.info(f"Starting FastAPI on port {config.WEBSERVER_PORT}.")
    if config.IS_WEBSERVER_PORT_DEFAULT:
        logger.warning("Running webserver on standard port.")
    uvicorn.run(
        app,
        host=config.WEBSERVER_HOST,
        port=config.WEBSERVER_PORT
    )


if __name__ == "__main__":
    run()
