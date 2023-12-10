import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/features/account/account_cubit.dart';
import 'package:frontend/src/features/account/widgets/account_sum.dart';
import 'package:frontend/src/features/account/widgets/account_widget.dart';
import 'package:frontend/src/features/cases/provider/cases_provider.dart';
import 'package:get_it/get_it.dart';

import '../../common/theme/colors/app_palette.dart';

class AccountPage extends StatelessWidget {
  final bool isNeedAppBar;

  const AccountPage({
    required this.isNeedAppBar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(
          cases: GetIt.I.get<CasesProvider>().data.strippedPortfolios),
      child: Scaffold(
        appBar: isNeedAppBar
            ? AppBar(
                surfaceTintColor: AppPalette.greyBg,
                backgroundColor: AppPalette.greyBg,
                foregroundColor: AppPalette.greyBg,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppPalette.greyText,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              )
            : null,
        body: BlocBuilder<AccountCubit, AccountState>(
            builder: (BuildContext context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 48,
              vertical: 36,
            ),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: (state is AccountLoaded)
                        ? ListView.builder(
                            itemCount: state.cases.length,
                            itemBuilder: (c, i) {
                              return AccountWidget(
                                accountcase: state.cases[i],
                              );
                            },
                          )
                        : const CircularProgressIndicator(),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  const Column(
                    children: [
                      AccountSum(),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
