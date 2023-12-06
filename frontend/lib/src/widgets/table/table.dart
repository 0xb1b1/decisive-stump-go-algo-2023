import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';
import 'package:frontend/src/widgets/table/paginated_data_table.dart';
import 'package:frontend/src/widgets/table/table_source.dart';

import '../../common/strings.dart';
import '../../features/transactions/models/transaction.dart';

class TransactionTable extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionTable({
    required this.transactions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(
      horizontalMargin: 20,
      rowsPerPage: 5,
      header: const Text(
        Strings.transactions,
        style: AppTypography.sectionTitle,
      ),
      availableRowsPerPage: const [5],
      columns: Strings.columnLabels
          .map(
            (e) => DataColumn(
              label: Text(
                e,
                style: AppTypography.tableTitle,
              ),
            ),
          )
          .toList(),
      source: TransactionsSource(transactions),
    );
  }
}
