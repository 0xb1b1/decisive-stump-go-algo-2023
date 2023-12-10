import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_stripped.freezed.dart';

part 'portfolio_stripped.g.dart';

@freezed
class PortfolioStripped with _$PortfolioStripped {
  const factory PortfolioStripped({
    required String uuid,
    required String sector,
    @Default('0.00') String profit,
  }) = _PortfolioStripped;

  factory PortfolioStripped.mock() => PortfolioStripped(
        uuid: 'eweKKKd2',
        sector: 'Недвижимость',
        profit: 100.03.toString(),
      );

  factory PortfolioStripped.fromJson(Map<String, dynamic> json) =>
      _$PortfolioStrippedFromJson(json);
}
