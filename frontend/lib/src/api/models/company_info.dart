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
    required num? stockPrice,
    required num? prognosisPercentage,
    String? portfolioId,
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
