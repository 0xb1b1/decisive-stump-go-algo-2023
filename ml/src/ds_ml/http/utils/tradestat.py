#!/usr/bin/env python3

from ds_ml.models.tradestat import \
    TradeStat


def read_csv(filename: str):
    with open(filename, "r") as file_h:
        for line in file_h:
            yield line.split('\n')[0].split(";")


def parse_into_tradestat(
    row: list[str],
    year: int,
    year_row: int,
) -> TradeStat:
    ts = TradeStat(
        year_row=year_row,
        year=year,
        tradedate=row[0],
        tradetime=row[1],
        secid=row[2],
        pr_open=float(row[3]) if row[3] != '' else None,
        pr_high=float(row[4]) if row[4] != '' else None,
        pr_low=float(row[5]) if row[5] != '' else None,
        pr_close=float(row[6]) if row[6] != '' else None,
        pr_std=float(row[7]) if row[7] != '' else None,
        vol=float(row[8]) if row[8] != '' else None,
        val=float(row[9]) if row[9] != '' else None,
        trades=float(row[10]) if row[10] != '' else None,
        pr_vwap=float(row[11]) if row[11] != '' else None,
        pr_change=float(row[12]) if row[12] != '' else None,
        trades_b=float(row[13]) if row[13] != '' else None,
        trades_s=float(row[14]) if row[14] != '' else None,
        val_b=float(row[15]) if row[15] != '' else None,
        val_s=float(row[16]) if row[16] != '' else None,
        vol_b=float(row[17]) if row[17] != '' else None,
        vol_s=float(row[18]) if row[18] != '' else None,
        disb=float(row[19]) if row[19] != '' else None,
        pr_vwap_b=float(row[20]) if row[20] != '' else None,
        pr_vwap_s=float(row[21]) if row[21] != '' else None,
    )

    return ts
