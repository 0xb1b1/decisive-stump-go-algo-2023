import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/src/features/account/account_page.dart';
import 'package:frontend/src/features/current_page/account_appbar.dart';
import 'package:frontend/src/features/new_case/new_case_page.dart';
import 'package:frontend/src/features/search/company_page.dart';
import 'package:get_it/get_it.dart';
import '../../common/strings.dart';
import '../../common/theme/colors/app_palette.dart';
import '../../common/theme/text/app_typography.dart';
import '../cases/cases_page.dart';
import '../cases/models/case.dart';
import '../search/cubit/search_cubit.dart';
import '../search/cubit/search_state.dart';
import '../stats/stat_page.dart';

class CurrentPage extends StatefulWidget {
  const CurrentPage({Key? key}) : super(key: key);

  @override
  State<CurrentPage> createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    const StatsPage(),
    CasesPage(
      cases: List.generate(8, (index) => Case.mock()),
      onCaseTap: () {},
    ),
    const NewCasePage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<SearchCubit>(),
      child: Scaffold(
        backgroundColor: AppPalette.greyBg,
        body: BlocListener<SearchCubit, SearchState>(
          listener: (BuildContext context, SearchState state) {
            state.maybeWhen(
              orElse: () {},
              error: () => showErrorDialog(context),
              data: (company) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CompanyPage(
                        company: company,
                        isInCase: company.portfolioId != null),
                  ),
                );
              },
            );
          },
          child: Row(
            children: [
              NavigationDrawer(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                backgroundColor: AppPalette.mainBlue,
                elevation: 0,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset('img/Logo.svg'),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Opacity(
                    opacity: 0.20,
                    child: Container(
                      margin: const EdgeInsets.only(left: 24, right: 32),
                      height: 1,
                      decoration: const BoxDecoration(color: Color(0xFFF3F4F6)),
                    ),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  NavigationDrawerDestination(
                    icon: SvgPicture.asset('icons/deselected/stats_d.svg'),
                    selectedIcon: SvgPicture.asset('icons/selected/stats.svg'),
                    label: const Text(Strings.stats),
                  ),
                  NavigationDrawerDestination(
                    icon: SvgPicture.asset('icons/deselected/cases_d.svg'),
                    selectedIcon: SvgPicture.asset('icons/selected/cases.svg'),
                    label: const Text(Strings.cases),
                  ),
                  NavigationDrawerDestination(
                    icon: SvgPicture.asset('icons/deselected/new_case_d.svg'),
                    selectedIcon:
                        SvgPicture.asset('icons/selected/new_case.svg'),
                    label: const Text(Strings.newCase),
                  ),
                  NavigationDrawerDestination(
                    icon: SvgPicture.asset('icons/deselected/account_d.svg'),
                    selectedIcon:
                        SvgPicture.asset('icons/selected/account.svg'),
                    label: const Text(Strings.myAccount),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    AccountAppbar(
                      onSearch: GetIt.I.get<SearchCubit>().getCompany,
                    ),
                    Expanded(child: pages[_selectedIndex]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showErrorDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text(
              'Понятно',
            ),
          ),
        ],
        content: const Text(
            "Проверьте интернет-соединение и введите тикер компании полностью"),
        title: const Text(
          "Произошла ошибка",
          style: AppTypography.sectionTitle,
        ),
      ),
    );
  }

  Future<void> showLoadingDialog(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 1),
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Dialog(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Text("Загружаем результаты поиска..."),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
