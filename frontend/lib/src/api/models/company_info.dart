import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_info.freezed.dart';

part 'company_info.g.dart';

@freezed
class CompanyInfo with _$CompanyInfo {
  const factory CompanyInfo({
    String? name,
    required String ticker,
    String? sector,
    String? description,
    @JsonKey(name: 'stock_price') required String stockPrice,
    @JsonKey(name: 'prognosis_percentage') required String prognosisPercentage,
    required StockActionRecommendation recommendation,
    @JsonKey(name: 'portfolio_uuid')String? portfolioUuid,
  }) = _CompanyInfo;

  factory CompanyInfo.fromJson(Map<String, dynamic> json) =>
      _$CompanyInfoFromJson(json);
}

@freezed
class StockActionRecommendation with _$StockActionRecommendation {
  const factory StockActionRecommendation({
    required String color,
    required String recommendation,
  }) = _StockActionRecommendation;

  factory StockActionRecommendation.fromJson(Map<String, Object?> json) =>
      _$StockActionRecommendationFromJson(json);
}
