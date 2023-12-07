import 'package:freezed_annotation/freezed_annotation.dart';

part 'case.freezed.dart';

part 'case.g.dart';

@freezed
class Case with _$Case {
  const factory Case({
    required String title,
    required String id,
    required double amount,
    required double weeklyProfitability,
    required double account,
    required String sector,
  }) = _Case;

  factory Case.mock() => const Case(
        id: 'eweKKKd2',
        title: 'Недвижимость',
        amount: 500.43,
        weeklyProfitability: 285.44,
        account: 12000,
        sector: 'Говна кусок',
      );

  factory Case.fromJson(Map<String, Object?> json) => _$CaseFromJson(json);
}
