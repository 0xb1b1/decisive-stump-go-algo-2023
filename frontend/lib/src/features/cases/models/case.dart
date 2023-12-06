import 'package:freezed_annotation/freezed_annotation.dart';

part 'case.freezed.dart';

part 'case.g.dart';

@freezed
class Case with _$Case {
  const factory Case({
    required String title,
    required double amount,
  }) = _Case;

  factory Case.mock() => const Case(title: 'Недвижимость', amount: 500.43);

  factory Case.fromJson(Map<String, Object?> json) => _$CaseFromJson(json);
}
