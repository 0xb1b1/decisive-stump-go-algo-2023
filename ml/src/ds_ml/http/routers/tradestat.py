#!/usr/bin/env python3
from fastapi import APIRouter, HTTPException, BackgroundTasks
from loguru import logger
from pymongo.errors import DuplicateKeyError
import os
import urllib
from pyunpack import Archive

from ds_ml import config

from ds_ml.db.databases import ml_db

from ds_ml.models.tradestat import \
    TradeStat

from ds_ml.db.repositories.tradestat import \
    TradeStatRepository

from ds_ml.http.models.generic import \
    FetchResponse

from ds_ml.constants.tradestat import \
    TRADESTAT_DOWNLOAD_LINKS

from ds_ml.http.utils.tradestat import \
    parse_into_tradestat, read_csv

# See https://fastapi.tiangolo.com/tutorial/bigger-applications/

router = APIRouter(
    prefix="/tradestat",
    tags=['TradeStat', ],
    # dependencies=[Depends(get_token_header)],
    responses={404: {"description": "Not found"}}
)

ts_repo = TradeStatRepository(database=ml_db)


def ts_parser() -> None:
    for year, url in TRADESTAT_DOWNLOAD_LINKS.items():
        filename: str = url.split("/")[-1]
        filepath = os.path.join(
            config.PARSE_TRADESTAT_BASE_DIR,
            filename,
        )

        # Check if file alreadt exists on disk
        if os.path.isfile(filepath):
            logger.info(
                f"Tradestat for year {year} already exists. Skipping download"
            )
            continue
        else:
            logger.info(
                f"Tradestat for year {year} doesn't exist. Downloading..."
            )

        # Retrieve file
        logger.info(
            f"Saving tradestat for year {year} into {filepath}"
        )
        urllib.request.urlretrieve(url, filepath)

        # Create unpack directory
        extract_dir = os.path.join(
            config.PARSE_TRADESTAT_BASE_DIR,
            filename.split(".7z")[0]  # Get filename without extension
        )
        os.makedirs(extract_dir, exist_ok=True)

        # Extract archive
        logger.info(
            f"Extracting archive {filename} to {extract_dir}"
        )
        Archive(filepath).extractall(extract_dir)
    logger.info(
        "Done extracting archives. Parsing them..."
    )
    dirs: list[str] = [os.path.join(config.PARSE_TRADESTAT_BASE_DIR, f)
                       for f in os.listdir(config.PARSE_TRADESTAT_BASE_DIR)
                       if os.path.isdir(os.path.join(config.PARSE_TRADESTAT_BASE_DIR, f))]  # noqa: E501

    repo_batch: list[TradeStat] = []  # max 75

    for directory in dirs:
        file = os.listdir(directory)[0]
        year = file.split(".csv")[0].split("_")[1]
        file = os.path.join(directory, file)

        logger.info(
            f"Parsing file {file}..."
        )

        counter = 0
        rows = read_csv(file)
        next(rows)

        for row in rows:
            if len(repo_batch) > 74:
                ts_repo.save_many(repo_batch)
                repo_batch = []
                logger.info(
                    "Saving batch TradeStat into DB."
                )
            repo_batch.append(parse_into_tradestat(row, year, counter))
            counter += 1


@router.post(
    "/parse_tradestat",
    response_model=FetchResponse,
)
def parse_tradestat(
    background_tasks: BackgroundTasks
):
    # Create the temporary directory
    os.makedirs(config.PARSE_TRADESTAT_BASE_DIR, exist_ok=True)
    background_tasks.add_task(ts_parser)

    return FetchResponse(
        is_successful=True
    )
