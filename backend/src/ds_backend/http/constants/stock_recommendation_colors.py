#!/usr/bin/env python3
from enum import Enum


class StockRecommendationColor(str, Enum):
    BUY = "0xFF1E833E"
    SELL = "0xFFBE0000"
    HOLD = "0xFF14161C"
