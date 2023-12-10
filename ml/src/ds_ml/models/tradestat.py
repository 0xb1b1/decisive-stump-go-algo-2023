#!/usr/bin/env python3
from pydantic import BaseModel
from pydantic_mongo import ObjectIdField


class TradeStat(BaseModel):
    id: ObjectIdField = None
    year_row: int
    year: int
    tradedate: str
    tradetime: str
    secid: str
    pr_open: float | None
    pr_high: float | None
    pr_low: float | None
    pr_close: float | None
    pr_std: float | None
    vol: float | None
    val: float | None
    trades: float | None
    pr_vwap: float | None
    pr_change: float | None
    trades_b: float | None
    trades_s: float | None
    val_b: float | None
    val_s: float | None
    vol_b: float | None
    vol_s: float | None
    disb: float | None
    pr_vwap_b: float | None
    pr_vwap_s: float | None
