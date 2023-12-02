#!/usr/bin/env python3
from fastapi import FastAPI
from loguru import logger
import uvicorn


def run() -> None:
    from ds_backend.http.routers.user import router as user_router

    app = FastAPI()
    app.include_router(user_router)

    logger.info("Starting FastAPI")
    uvicorn.run(app, port=8040)


if __name__ == "__main__":
    run()
