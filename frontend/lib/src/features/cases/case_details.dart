import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/features/cases/cubit/case_cubit.dart';
import 'package:frontend/src/features/cases/models/button_parameters.dart';
import 'package:frontend/src/features/cases/models/case.dart';
import 'package:frontend/src/widgets/graph_widget.dart';
import 'package:frontend/src/widgets/income_widget.dart';
import 'package:frontend/src/features/cases/widgets/case_info.dart';
import 'package:frontend/src/features/cases/widgets/table/companies_table.dart';
import 'package:frontend/src/features/cases/widgets/uneditable_table.dart';

import '../../common/strings.dart';
import '../account/account_page.dart';
import 'cubit/case_state.dart';

class CaseDetails extends StatelessWidget {
  final Case portfolio;

  const CaseDetails({
    required this.portfolio,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CaseCubit()..initialFetch(portfolio.id),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppPalette.greyBg,
          foregroundColor: AppPalette.greyBg,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppPalette.greyText,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 48,
            vertical: 36,
          ),
          child: BlocBuilder<CaseCubit, CaseState>(
            builder: (BuildContext context, CaseState state) {
              return state.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                stats: (companies) => Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CaseInfo(
                              portfolio: portfolio,
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            child: IncomeWidget(
                              isColored: true,
                              title: Strings.currentIncome,
                              buttonTitle: Strings.withdrawMoney,
                              onButtonTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const AccountPage(),
                                ),
                              ),
                              income: portfolio.account,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: GraphWidget(
                              title: Strings.caseStats,
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            child: UneditableTable(companies: companies),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                editing: (inCase, stopped, inactive) {
                  return ListView(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CaseInfo(
                              portfolio: portfolio,
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            child: IncomeWidget(
                              isColored: true,
                              title: Strings.currentIncome,
                              buttonTitle: Strings.withdrawMoney,
                              onButtonTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const AccountPage(),
                                ),
                              ),
                              income: portfolio.account,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      CompaniesTable(
                        companies: inCase,
                        tableTitle: Strings.companiesInCase,
                        buttonParameters: [
                          ButtonParameters(
                              action: BlocProvider.of<CaseCubit>(context)
                                  .stopSellFromInCase,
                              title: Strings.stopStocks),
                          ButtonParameters(
                              action: BlocProvider.of<CaseCubit>(context)
                                  .makeInactiveFromInCase,
                              title: Strings.makeInactiveStocks),
                        ],
                      ),
                      const SizedBox(height: 24),
                      CompaniesTable(
                        companies: stopped,
                        tableTitle: Strings.stoppedCompanies,
                        buttonParameters: [
                          ButtonParameters(
                            action: BlocProvider.of<CaseCubit>(context)
                                .resumeFromStopped,
                            title: Strings.resumeStocks,
                          ),
                          ButtonParameters(
                            action: BlocProvider.of<CaseCubit>(context)
                                .makeInactiveFromStopped,
                            title: Strings.makeInactiveStocks,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      CompaniesTable(
                        tableTitle: Strings.inactiveCompanies,
                        companies: inactive,
                        buttonParameters: [
                          ButtonParameters(
                            action: BlocProvider.of<CaseCubit>(context)
                                .resumeFromInactive,
                            title: Strings.resumeStocks,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
