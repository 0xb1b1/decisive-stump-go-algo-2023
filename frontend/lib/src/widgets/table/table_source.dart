import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/strings.dart';
import '../../features/transactions/models/transaction.dart';

class TransactionsSource extends DataTableSource {
  final List<Transaction> transactions;

  TransactionsSource(this.transactions);

  @override
  DataRow? getRow(int index) {
    final transaction = transactions[index];
    final formattedDate =
        DateFormat('dd.MM.yyyy – HH:mm:ss').format(transaction.date);
    return DataRow(
      cells: [
        DataCell(Text(transaction.portfolio)),
        DataCell(Text(transaction.type.name)),
        DataCell(Text(formattedDate)),
        DataCell(Text(transaction.count.toString())),
        DataCell(Text(
            '${transaction.singleAmount.toStringAsFixed(2)} ${Strings.rurSymbol}')),
        DataCell(Text(
            '${transaction.amount.toStringAsFixed(2)} ${Strings.rurSymbol}')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => transactions.length;

  @override
  int get selectedRowCount => 0;
}
