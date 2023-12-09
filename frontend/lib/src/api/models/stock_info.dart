import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_info.freezed.dart';

part 'stock_info.g.dart';

@freezed
class StockInfo with _$StockInfo {
  const factory StockInfo({
    required String symbol,
    String? company,
    String? description,
    String? sector,
  }) = _StockInfo;

  factory StockInfo.fromJson(Map<String, dynamic> json) =>
      _$StockInfoFromJson(json);
}
