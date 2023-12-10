import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/api/models/portfolio_stripped.dart';

part 'portfolios_dashboard.freezed.dart';

part 'portfolios_dashboard.g.dart';

@freezed
class PortfoliosDashboard with _$PortfoliosDashboard {
  const factory PortfoliosDashboard({
    @JsonKey(name: 'stripped_portfolios')
    required List<PortfolioStripped> strippedPortfolios,
  }) = _PortfoliosDashboard;

  factory PortfoliosDashboard.fromJson(Map<String, dynamic> json) =>
      _$PortfoliosDashboardFromJson(json);
}
