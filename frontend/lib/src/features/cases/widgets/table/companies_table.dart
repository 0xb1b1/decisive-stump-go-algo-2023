import 'package:flutter/material.dart';
import 'package:frontend/src/api/models/portfolio_stock.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';
import 'package:frontend/src/features/cases/widgets/table/button_table.dart';
import 'package:frontend/src/features/cases/widgets/table/companies_source.dart';
import 'package:frontend/src/widgets/table/paginated_data_table.dart';

import '../../../../common/strings.dart';

import '../../models/button_parameters.dart';

class CompaniesTable extends StatefulWidget {
  final List<PortfolioStock> companies;
  final String tableTitle;
  final List<ButtonParameters> buttonParameters;

  const CompaniesTable({
    required this.companies,
    required this.tableTitle,
    required this.buttonParameters,
    Key? key,
  }) : super(key: key);

  @override
  State<CompaniesTable> createState() => _CompaniesTableState();
}

class _CompaniesTableState extends State<CompaniesTable> {
  late List<bool> selected;

  @override
  void initState() {
    selected = List.generate(widget.companies.length, (index) => false);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CompaniesTable oldWidget) {
    if (widget.companies != oldWidget.companies) {
      updateSelected();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(
      horizontalMargin: 20,
      rowsPerPage: getRowsPerPage(),
      header: Row(
        children: [
          Text(
            widget.tableTitle,
            style: AppTypography.sectionTitle,
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Row(
              children: widget.buttonParameters
                  .map(
                    (e) => TableButton(
                      isActive: true,
                      title: e.title,
                      onButtonTap: () => e.action(getSelectedIndexes()),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      availableRowsPerPage: [widget.companies.length],
      columns: Strings.companyColumnLabels
          .map(
            (e) => DataColumn(
              label: Text(
                e,
                style: AppTypography.tableTitle,
              ),
            ),
          )
          .toList(),
      source: CompaniesSource(
        companyList: widget.companies,
        selectedList: selected,
        onSelectChanged: onSelectChanged,
      ),
    );
  }

  void onSelectChanged(bool value, int index) {
    setState(() {
      selected[index] = value;
    });
  }

  List<PortfolioStock> getSelectedIndexes() {
    final trueIndices = selected
        .asMap()
        .entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();
    List<PortfolioStock> selectedCompanies =
        trueIndices.map((index) => widget.companies[index]).toList();
    updateSelected();
    return selectedCompanies;
  }

  void updateSelected() {
    selected = List.generate(widget.companies.length, (index) => false);
  }

  int getRowsPerPage() {
    if (widget.companies.length > 5) {
      return 5;
    } else if (widget.companies.isEmpty) {
      return 1;
    }
    return widget.companies.length;
  }
}
