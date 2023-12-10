import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_wrapper.freezed.dart';

part 'portfolio_wrapper.g.dart';

@freezed
class PortfolioWrapper with _$PortfolioWrapper {
  const factory PortfolioWrapper({
    required String uuid,
    required String name,
    required int numberEnd,
    required int money,
  }) = _PortfolioWrapper;

  factory PortfolioWrapper.fromJson(Map<String, dynamic> json) =>
      _$PortfolioWrapperFromJson(json);
}
