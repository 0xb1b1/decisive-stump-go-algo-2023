import numpy as np
from itertools import dropwhile
from typing import List

PREVIOUS_LEN = 2
PREDICTS_LEN = 8

def rindex(lst, item):
    def index_ne(x):
        return lst[x] != item

    try:
        return next(dropwhile(index_ne, reversed(range(len(lst)))))
    except StopIteration:
        raise ValueError("rindex(lst, item): item not in list")
        
               
class TradeBot:
    def __init__(self, previous_len, predicts_len):
        """
        each param for 1 company
        :param previous_len: int,
        :param predicts_len: int
        """
        
        self.previous_len = previous_len
        self.predicts_len = predicts_len

    def __call__(self, previous_prices: List, predicts_prices: List):
        """
        each param for 1 company
        :param previous_price: list,
        :param predicts_prices: list
        
        returns:
            [{'price': 2568.6, 'profit': 0, 'decision': 'buy'},
             {'price': 2580.0, 'profit': 11.400000000000091, 'decision': 'sell'},
             {'price': 2576.2, 'profit': 0, 'decision': 'hold'},]
        """
        assert len(previous_prices) == self.previous_len, 'incorrect shape of previous prices list'
        assert len(predicts_prices) == self.predicts_len, 'incorrect shape for predicts list'
        
        for i in range(self.previous_len):
            predicts_prices.insert(0, previous_prices[-i + 1])
        
        metrics = []
        decisions = []
        for i in range(len(predicts_prices) - self.previous_len):
            ci = predicts_prices[i]
            ci_plus_1 = predicts_prices[i + 1]
            ci_plus_2 = predicts_prices[i + 2]

            delta_i = np.sign(ci_plus_1 - ci)  # 1 -1
            delta_i_plus_1 = np.sign(ci_plus_2 - ci_plus_1)  # 1 -1

            delta_curvature = delta_i_plus_1 - delta_i
   
            if delta_curvature == -2:
                decisions.append('sell')
            elif delta_curvature == 0:
                decisions.append('hold')
            elif delta_curvature == 2:
                decisions.append('buy')

            if decisions[-1] == 'sell' and 'buy' in decisions: # продажа
                price_buy = predicts_prices[rindex(decisions, 'buy') + 1]
                price_sell = predicts_prices[rindex(decisions, 'sell') + 1]

                metrics.append({'price': ci_plus_1.item(),
                                'profit': (price_sell - price_buy).item(),
                                'decision': 'sell'})
            elif decisions[-1] == 'buy':
                metrics.append({'price': ci_plus_1.item(),
                                'profit': 0,
                                'decision': 'buy'})
            else:
                metrics.append({'price': ci_plus_1.item(),
                                'profit': 0,
                                'decision': 'hold'})
            
        return metrics