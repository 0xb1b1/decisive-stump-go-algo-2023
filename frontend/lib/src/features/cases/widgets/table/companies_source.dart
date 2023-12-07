import 'package:flutter/material.dart';

import '../../../../common/strings.dart';
import '../../models/company.dart';

class CompaniesSource extends DataTableSource {
  final List<Company> companyList;
  final List<bool> selectedList;
  final void Function(bool, int) onSelectChanged;

  CompaniesSource({
    required this.companyList,
    required this.selectedList,
    required this.onSelectChanged,
  });

  @override
  DataRow? getRow(int index) {
    final company = companyList[index];
    return DataRow(
      selected: selectedList[index],
      onSelectChanged: (value) => onSelectChanged(value!, index),
      cells: [
        DataCell(Text(company.title)),
        DataCell(Text(company.ticker)),
        DataCell(Text(company.count.toString())),
        DataCell(
          Text(
              '${company.amountSingle.toStringAsFixed(2)} ${Strings.rurSymbol}'),
        ),
        DataCell(
          Text('${company.amount.toStringAsFixed(2)} ${Strings.rurSymbol}'),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => companyList.length;

  @override
  int get selectedRowCount => 0;
}
