import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';

part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String portfolio,
    required TransactionType type,
    required DateTime date,
    required int count,
    required double singleAmount,
    required double amount,
  }) = _Transaction;

  factory Transaction.mock() => Transaction(
        portfolio: 'Недвижимость',
        type: TransactionType.buy,
        date: DateTime.now(),
        count: 150,
        singleAmount: 1500.69,
        amount: 16000.43,
      );

  factory Transaction.fromJson(Map<String, Object?> json) =>
      _$TransactionFromJson(json);
}

enum TransactionType {
  buy,
  sale,
}

List<Transaction> mockedTransactions = List.generate(1000, (index) {
  final nowDate = DateTime.now();
  return Transaction(
    portfolio: 'Недвижимость',
    type: index.isEven ? TransactionType.buy : TransactionType.sale,
    date: nowDate.add(Duration(days: index)),
    count: index * 2,
    singleAmount: 102.43 * index,
    amount: 102.43 * index,
  );
});
