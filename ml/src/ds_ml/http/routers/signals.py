from fastapi import APIRouter
from loguru import logger

router = APIRouter()


@router.on_event("shutdown")
def shutdown():
    logger.info("Received SIGINT, terminating.")
