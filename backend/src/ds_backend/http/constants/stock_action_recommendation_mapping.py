#!/usr/bin/env python3
from ds_backend.http.schemas.company import \
    StockActionRecommendationEnum

from ds_backend.http.constants.stock_action_recommendation_colors import \
    StockActionRecommendationColor


stock_action_recommendation_mapping = {
    StockActionRecommendationEnum.BUY: StockActionRecommendationColor.BUY,
    StockActionRecommendationEnum.SELL: StockActionRecommendationColor.SELL,
    StockActionRecommendationEnum.HOLD: StockActionRecommendationColor.HOLD,
}
