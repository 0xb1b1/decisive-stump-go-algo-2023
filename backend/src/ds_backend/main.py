#!/usr/bin/env python3
from fastapi import FastAPI, Request, status
from fastapi.middleware.cors import CORSMiddleware
from fastapi.exceptions import RequestValidationError
from fastapi.responses import JSONResponse
from loguru import logger
import uvicorn
import sys

from ds_backend import config


fastapi_tags_metadata = [
    {
        "name": "Authentication",
        "description": "Operations regarding user identity.",
    },
    {
        "name": "News",
        "description": "Get data related to parsed news.",
    },
    {
        "name": "Tickers",
        "description": "Operations with individual tickers.",
    },
    {
        "name": "Companies",
        "description": "Operations related to companies.",
    },
    {
        "name": "Portfolios",
        "description": "Operations related to portfolios. Authentication is required.",  # noqa: E501
    },
]


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
    from ds_backend.http.routers.portfolios import router as portfolios_router

    from ds_backend.http.routers.signals import router as sig_router

    app = FastAPI(
        openapi_tags=fastapi_tags_metadata,
    )

    def register_exception(app: FastAPI):
        @app.exception_handler(RequestValidationError)
        async def validation_exception_handler(
            request: Request,
            exc: RequestValidationError
        ):

            exc_str = f'{exc}'.replace('\n', ' ').replace('   ', ' ')
            # or logger.error(f'{exc}')
            logger.error(request, exc_str)
            content = {'status_code': 10422, 'message': exc_str, 'data': None}
            return JSONResponse(
                content=content,
                status_code=status.HTTP_422_UNPROCESSABLE_ENTITY
            )

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
    app.include_router(portfolios_router)

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
