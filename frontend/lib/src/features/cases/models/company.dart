import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';

part 'company.g.dart';

@freezed
class Company with _$Company {
  const factory Company({
    required String title,
    required String income,
    required String ticker,
    required int count,
    required double amountSingle,
    required double amount,
  }) = _Company;

  factory Company.mock() => const Company(
        title: "ООО Говно",
        income: "+285.44%",
        ticker: "АААА",
        count: 150,
        amountSingle: 2340.34,
        amount: 239.434,
      );

  factory Company.fromJson(Map<String, Object?> json) => _$CompanyFromJson(json);
}
