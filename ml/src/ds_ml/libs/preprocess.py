import numpy as np
import pandas as pd
import talib as ta

import re
import ast


def str2array(s):
    # Remove space after [
    s = re.sub('\[ +', '[', s.strip())
    # Replace commas and spaces
    s = re.sub('[,\s]+', ', ', s)
    return np.array(ast.literal_eval(s))

NUMERICAL_COLUMNS = ["pr_open", "pr_high", "pr_low", "pr_close", "vol", "val", 'val_b', 'val_s', 'vol_b', 'vol_s', 'pr_vwap', "pr_vwap_b", "pr_vwap_s"]
CATEGORICAL_COLUMNS = ['minstep_encoded', 'decimals_encoded', 'listlevel_encoded', 'lotsize_encoded', 'Sphere']

class Preprocessor:
    def __init__(self, all_shares: str):
        """
        :param trades_table: pd.DataFrame (tradestats dataset)
        :param all_shares: pd.DataFrame (Market('shares).tickers() + embedings)
        """
        self.all_shares = pd.read_csv(all_shares)
        self.all_shares['encoded'] = self.all_shares['encoded'].apply(str2array)
        self.dropping_num = 5*8
    
    def _get_date_hour(self, table):
        table["tradedatetime"] = pd.to_datetime(table["tradedate"] + table["tradetime"], format="%Y-%m-%d%H:%M:%S")
        table = table.drop(columns=["tradedate", "tradetime"])
        table["hour"] = table["tradedatetime"].dt.hour
        table["date"] = pd.to_datetime(table["tradedatetime"].dt.date)
        table = table.drop(columns=["tradedatetime"])
        return table

    def preprocess_tickers(self, trades_table, min_samples=128):
        trades_table = trades_table[["secid", "pr_open", "pr_high", "pr_low", "pr_close",
                                     "vol", "val", "tradedate", "tradetime", 'trades',
                                     'trades_b','trades_s','val_b','val_s','vol_b','vol_s','disb']]
        
        trades_table = self._get_date_hour(trades_table)
        
        trades_table = (trades_table.groupby(["secid", "date", "hour"]).agg({"pr_low": min,
                                                                             "pr_high": max,
                                                                             "pr_open": "first",
                                                                             "pr_close": "last",
                                                                             "vol": sum,
                                                                             "val": sum,
                                                                             'trades': sum,
                                                                             'trades_b': sum,
                                                                             'trades_s': sum,
                                                                             'val_b': sum,
                                                                             'val_s': sum,
                                                                             'vol_b': sum,
                                                                             'vol_s': sum}).reset_index()
        )
        trades_table = trades_table.sort_values(by=["date", "hour"])
        trades_table["pr_vwap"] = trades_table["val"] / (trades_table["vol"])
        trades_table["pr_vwap_b"] = trades_table["val_b"] / (trades_table["vol_b"])
        trades_table["pr_vwap_s"] = trades_table["val_s"] / (trades_table["vol_s"])
        trades_table['disb'] = (trades_table['vol_b'] - trades_table['vol_s']) / trades_table['vol']
        trades_table['pr_change'] = (1 - trades_table['pr_open'] / trades_table['pr_close']) * 100
        trades_table = trades_table.merge(self.all_shares[['issuesize', 'minstep_encoded', 'listlevel_encoded', 'encoded',
                                                           'secid', 'Sphere', 'decimals_encoded', 'lotsize_encoded']], on='secid', how='inner')

        # numcols = ['pr_open', 'pr_high', 'pr_low', 'pr_close', 'vol', 'val', 'val_b', 'val_s',
        #            'vol_b', 'vol_s', 'pr_vwap', 'pr_vwap_b', 'pr_vwap_s']

        grouped_data = trades_table.groupby('secid')
        
        numcols = NUMERICAL_COLUMNS[:]

        for feature in NUMERICAL_COLUMNS:
            # volatility feature
            trades_table[f'volatility_{feature}_per_week'] = grouped_data[feature].pct_change().rolling(window=self.dropping_num).std()
            # relative strength feature
            trades_table[f'rs_{feature}_per_week'] = grouped_data[feature].transform(lambda x: x / x.rolling(window=self.dropping_num).mean())
            for window_size in (10, 20):
                # moving average features
                trades_table[f'{feature}_MA_{window_size}'] = grouped_data[feature].rolling(window=window_size).mean().reset_index(drop=True)
                numcols.append(f'{feature}_MA_{window_size}')


        # RSI (Relative Strength Index)
        trades_table['RSI_14'] = grouped_data['pr_close'].transform(lambda x: ta.RSI(x, timeperiod=14))

        # MACD (Moving Average Convergence Divergence)
        trades_table['MACD'] = grouped_data['pr_close'].transform(lambda x: ta.MACD(x, fastperiod=12, slowperiod=26, signalperiod=9)[0])
        trades_table['Signal_Line'] = grouped_data['pr_close'].transform(lambda x: ta.MACD(x, fastperiod=12, slowperiod=26, signalperiod=9)[1])

        # Stochastic Oscillator
        stoch_data = grouped_data.apply(lambda group: pd.DataFrame(ta.STOCH(group['pr_high'],
                                                                            group['pr_low'], 
                                                                            group['pr_close'], 
                                                                            fastk_period=14, 
                                                                            slowk_period=3, 
                                                                            slowd_period=3)).transpose()).reset_index(level=0, drop=True)

        trades_table[['%K', '%D']] = stoch_data

        # Relative Vigor Index - RVI
        # trades_table['RVI'] = grouped_data.apply(lambda group: (group['pr_close'] - group['pr_open']) / (group['pr_high'] - group['pr_low'])).reset_index(level=0, drop=True)

        # Rate of Change - ROC
        trades_table['ROC_8'] = grouped_data['pr_close'].transform(lambda x: ta.ROC(x, timeperiod=8))

        trades_table = trades_table.drop(columns=['issuesize'])
        
        trades_table = trades_table.merge(trades_table.groupby('secid')['pr_close'].agg('count').reset_index().rename(columns={'pr_close': 'len'}), on='secid', how='left')
        
        trades_table = trades_table.dropna()
        
        assert trades_table['len'].min()>=min_samples, f'Not enough samples in data! {trades_table["len"].min()} out of {min_samples}'
        
        trades_table = trades_table.drop(columns=['len'])
        raw_numerical = list(set(trades_table.columns) - set(CATEGORICAL_COLUMNS) - set(['secid', 'date', 'hour', 'encoded']))
        # numcols = list(set(numcols)-set(['pr_close']))
        
        trades_table = trades_table.set_index('secid')
        return trades_table, raw_numerical, numcols, CATEGORICAL_COLUMNS
    
    def prepare_to_fit(self, table, numcols, scalers):
        for name in table.index.unique().to_list():
            numcols = scalers[name]['features'].feature_names_in_
            table.loc[name, numcols] = scalers[name]['features'].transform(table.loc[name, numcols])
            table.loc[name, 'pr_close'] = scalers[name]['target'].transform(table.loc[name, 'pr_close'].values.reshape(-1, 1))
        return table, table.index.unique().to_list()
    
    def unprepare(self, predicts, indeces, scalers):
        l_preds = []
        for idx, name in enumerate(indeces):
            l_preds.append(list(scalers[name]['target'].inverse_transform(predicts[idx].reshape(-1, 1))))
        return l_preds