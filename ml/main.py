import torch
import numpy as np
import joblib
from libs.networks.model import LSTM
from libs.preprocess import Preprocessor
from libs.trade_bot import TradeBot
from typing import List

from tqdm.auto import tqdm


class Predictor:
    def __init__(self, model, vocab_sizes, scalers, all_shares, getter, predict_len=8, bot_prev_len=2):
        vocab_sizes = joblib.load(vocab_sizes)
        self._vocab_sizes = list(vocab_sizes.values())
        self._model = LSTM(input_dim=76, 
                          hidden_dim=512, 
                          output_dim=predict_len, 
                          vocab_sizes=self._vocab_sizes, 
                          emb_dim=256,
                          desc_dim=768)
        self._model.load_state_dict(torch.load(model))
        self._model.eval()
        self._scalers = joblib.load(scalers)
        self._ticker_getter = getter
        self._trade_bot = TradeBot(bot_prev_len, predict_len)
        self._preprocessor = Preprocessor(all_shares)
    
    @torch.no_grad()
    def predict(self, tickers: List[str], date:str, time: str, seq_len: int):
        trades_table = self._ticker_getter.get_trades(tickers, date, time, seq_len+self._preprocessor.dropping_num)
        trades_table, raw_numerical, numcols, categoricalcols = self._preprocessor.preprocess_tickers(trades_table, seq_len)
        trades_table, indeces = self._preprocessor.prepare_to_fit(trades_table, numcols, self._scalers)
        

        numerical, descriptions, categorical = torch.tensor([]), torch.tensor([]),torch.tensor([])
        id2company = dict()
        # print(indeces)
        for idx, company_name in enumerate(indeces):
            company = trades_table.loc[company_name]
            # print(raw_numerical)
            num_cols = torch.from_numpy(company.iloc[-seq_len:][raw_numerical].values).float().unsqueeze(0)
            desc_col = torch.tensor(np.stack(company['encoded'])).float()[:num_cols.shape[0]]
            cat_cols = torch.tensor(company[categoricalcols].values).float().unsqueeze(1)[:num_cols.shape[0]]
            numerical = torch.cat([numerical, num_cols], dim=0)
            descriptions = torch.cat([descriptions, desc_col], dim=0)
            categorical = torch.cat([categorical, cat_cols], dim=0)
            id2company[idx] = company_name
        # print(raw_numerical)   
        predicts = self._model(numerical, categorical, descriptions)
        predicts = self._preprocessor.unprepare(predicts, indeces, self._scalers)
        
        output = dict()
        for key in id2company.keys():
            output[id2company[key]] = self._trade_bot(self._scalers[id2company[key]]['target'].inverse_transform(trades_table.loc[id2company[key], 'pr_close'].iloc[-2:].values.reshape(-1, 1)), predicts[key])
        return output
        
    