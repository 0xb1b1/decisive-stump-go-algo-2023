#!/usr/bin/env python3
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from loguru import logger
import uvicorn
import sys

from ds_backend import config


def run() -> None:
    # Set up Loguru
    logger.remove()
    logger.add(sys.stderr, level=config.LOGGING_LEVEL)
    logger.critical(f"Logging level set to {config.LOGGING_LEVEL}.")

    # Sentry
    import sentry_sdk
    from sentry_sdk.integrations.pymongo import PyMongoIntegration
    from sentry_sdk.integrations.loguru import LoguruIntegration
    sentry_sdk.init(
        dsn="https://3e8060004e03414babfd8abeaba61be3@glitchtip.seizure.icu/1",
        enable_tracing=True,
        integrations=[
            PyMongoIntegration(),
            LoguruIntegration(),
        ],
    )
    logger.info("Initialized Sentry.")

    from ds_backend.http.routers.auth import router as auth_router
    from ds_backend.http.routers.news import router as news_router
    from ds_backend.http.routers.tickers import router as tickers_router
    from ds_backend.http.routers.companies import router as companies_router

    from ds_backend.http.routers.signals import router as sig_router

    app = FastAPI()

    # CORS Policy
    origins = ["*"]

    app.add_middleware(
        CORSMiddleware,
        allow_origins=origins,
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    # Routers
    app.include_router(auth_router)
    app.include_router(news_router)
    app.include_router(sig_router)
    app.include_router(tickers_router)
    app.include_router(companies_router)

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
