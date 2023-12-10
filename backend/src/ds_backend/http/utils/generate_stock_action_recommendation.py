#!/usr/bin/env python3

from ds_backend.http.schemas.company import \
    StockActionRecommendation, \
    StockActionRecommendationEnum

from ds_backend.http.constants.stock_action_recommendation_mapping import \
    stock_action_recommendation_mapping


def gen_action_recommendation(
    action: StockActionRecommendationEnum
) -> StockActionRecommendation:
    return StockActionRecommendation(
            recommendation=action,
            color=stock_action_recommendation_mapping.get(action),
        )
