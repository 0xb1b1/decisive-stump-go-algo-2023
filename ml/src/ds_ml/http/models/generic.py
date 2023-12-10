#!/usr/bin/env python3
from pydantic import BaseModel


class FetchResponse(BaseModel):
    is_successful: bool
