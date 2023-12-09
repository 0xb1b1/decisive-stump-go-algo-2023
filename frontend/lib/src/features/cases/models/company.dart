import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';

part 'company.g.dart';

@freezed
class Company with _$Company {
  const factory Company({
    required String title,
    required double income,
    required double currentPrice,
    required String recomendation,
    required String sector,
    required String ticker,
    required int count,
    required double amountSingle,
    required double amount,
    required String about,
  }) = _Company;

  factory Company.mock() => const Company(
        title: "ООО Говно",
        income: 285.5,
        ticker: "АААА",
        count: 150,
        amountSingle: 2340.34,
        amount: 239.434,
        currentPrice: 234234.23,
        recomendation: "Покупать",
        sector: "Недвижимость",
        about: 'Компания не очень всем пока........',
      );

  factory Company.fromJson(Map<String, Object?> json) =>
      _$CompanyFromJson(json);
}
