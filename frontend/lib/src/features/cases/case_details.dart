import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/features/cases/cubit/case_cubit.dart';
import 'package:frontend/src/features/cases/models/button_parameters.dart';
import 'package:frontend/src/repository/app_repository.dart';
import 'package:frontend/src/widgets/graph_widget.dart';
import 'package:frontend/src/widgets/income_widget.dart';
import 'package:frontend/src/features/cases/widgets/case_info.dart';
import 'package:frontend/src/features/cases/widgets/table/companies_table.dart';
import 'package:frontend/src/features/cases/widgets/uneditable_table.dart';
import 'package:get_it/get_it.dart';

import '../../common/strings.dart';
import '../account/account_page.dart';
import 'cubit/case_state.dart';

class CaseDetails extends StatelessWidget {
  final String portfolioUuid;

  const CaseDetails({
    required this.portfolioUuid,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CaseCubit(repository: GetIt.I.get<AppRepository>())
        ..initialFetch(portfolioUuid),
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
                stats: (portfolio, companies) => Column(
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
                                  builder: (context) => const AccountPage(
                                    isNeedAppBar: true,
                                  ),
                                ),
                              ),
                              income: double.parse(portfolio.profit),
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
                          Expanded(
                            flex: 2,
                            child: GraphWidget(
                              title: Strings.caseStats,
                              realDay: List.generate(
                                  8,
                                  (index) => StockData(
                                      pointX: 10.0 + index,
                                      pointY:
                                          Random().nextDouble() * 1000 + 300)),
                              predictedDay: List.generate(
                                  2,
                                  (index) => StockData(
                                      pointX: 18.0 + index,
                                      pointY:
                                          Random().nextDouble() * 1000 + 300)),
                              realWeek: List.generate(
                                  8,
                                  (index) => StockData(
                                      pointX: index / 2,
                                      pointY:
                                          Random().nextDouble() * 1000 + 300)),
                              predictedWeek: List.generate(
                                  2,
                                  (index) => StockData(
                                      pointX: (8 + index) / 2,
                                      pointY:
                                          Random().nextDouble() * 1000 + 300)),
                              realMonth: List.generate(
                                  8,
                                  (index) => StockData(
                                      pointX: index * 2,
                                      pointY:
                                          Random().nextDouble() * 1000 + 300)),
                              predictedMonth: List.generate(
                                  2,
                                  (index) => StockData(
                                      pointX: (8 + index) * 2,
                                      pointY:
                                          Random().nextDouble() * 1000 + 300)),
                              realHalfYear: List.generate(
                                  8,
                                  (index) => StockData(
                                      pointX: index / 2,
                                      pointY:
                                          Random().nextDouble() * 1000 + 300)),
                              predictedHalfYear: List.generate(
                                  2,
                                  (index) => StockData(
                                      pointX: (8 + index) / 2,
                                      pointY:
                                          Random().nextDouble() * 1000 + 300)),
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
                editing: (portfolio, inCase, stopped, inactive) {
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
                                  builder: (context) => const AccountPage(
                                    isNeedAppBar: true,
                                  ),
                                ),
                              ),
                              income: double.parse(portfolio.profit),
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
