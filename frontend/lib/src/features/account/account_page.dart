import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/features/account/account_cubit.dart';
import 'package:frontend/src/features/account/widgets/account_sum.dart';
import 'package:frontend/src/features/account/widgets/account_widget.dart';

import '../../common/theme/colors/app_palette.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(),
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
                        : CircularProgressIndicator(),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Column(
                    children: [
                      const AccountSum(),
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
