FROM python:3.12-bookworm AS builder

RUN pip install --no-cache-dir poetry==1.4.2

ARG POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

WORKDIR /srv/app

COPY pyproject.toml poetry.lock ./

RUN --mount=type=cache,target=$POETRY_CACHE_DIR poetry install --without dev --no-root

FROM python:3.12-slim-bookworm

ENV DS_ML_LOGGING_LEVEL \
    DS_ML_WEBSERVER_HOST \
    DS_ML_WEBSERVER_PORT \
    DS_ML_MONGO_URL \
    DS_ML_MONGO_ML_DB \
    DS_ML_PARSE_TRADESTAT_BASE_DIR

WORKDIR /srv/app

# hadolint ignore=DL3008,DL3009,DL3015
RUN apt-get update -y && \
    apt-get install -y p7zip && \
    rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

ENV VIRTUAL_ENV=/srv/app/.venv \
    PATH="/srv/app/.venv/bin:$PATH" \
    PYTHONPATH=/srv/app/src

COPY --from=builder ${VIRTUAL_ENV} ${VIRTUAL_ENV}

WORKDIR /srv/app/src

COPY ./src ./

ENTRYPOINT ["python", "-m", "ds_ml.main"]
