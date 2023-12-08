import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/features/cases/cubit/case_cubit.dart';
import 'package:frontend/src/features/cases/models/button_parameters.dart';
import 'package:frontend/src/features/cases/models/case.dart';
import 'package:frontend/src/features/cases/widgets/case_income.dart';
import 'package:frontend/src/features/cases/widgets/case_info.dart';
import 'package:frontend/src/features/cases/widgets/table/companies_table.dart';

import '../../common/strings.dart';
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
                stats: (_, __) => ListView(
                  children: const [
                    CaseInfo(),
                  ],
                ),
                editing: (inCase, stopped, inactive) {
                  return ListView(
                    children: [
                      const Row(
                        children: [
                          Expanded(
                            child: CaseInfo(),
                            flex: 2,
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          CaseIncome()
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
                              title: Strings.resumeStocks),
                          ButtonParameters(
                              action: BlocProvider.of<CaseCubit>(context)
                                  .makeInactiveFromStopped,
                              title: Strings.makeInactiveStocks),
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
                              title: Strings.resumeStocks),
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
