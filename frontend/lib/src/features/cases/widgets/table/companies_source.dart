import 'package:flutter/material.dart';
import 'package:frontend/src/api/models/portfolio_stock.dart';

import '../../../../common/strings.dart';

class CompaniesSource extends DataTableSource {
  final List<PortfolioStock> companyList;
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
        DataCell(Text(company.company)),
        DataCell(Text(company.ticker)),
        DataCell(Text(company.amount.toString())),
        DataCell(
          Text(
              '${double.parse(company.pricePerShare).toStringAsFixed(2)} ${Strings.rurSymbol}'),
        ),
        DataCell(
          Text(
              '${double.parse(company.priceSum).toStringAsFixed(2)} ${Strings.rurSymbol}'),
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
