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
        body: BlocBuilder<SearchCubit, SearchState>(
            builder: (BuildContext context, SearchState state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            data: (data) => CompanyPage(
              company: data,
              isInCase: data.portfolioId != null,
            ),
            unknown: () => Row(
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
                        decoration:
                            const BoxDecoration(color: Color(0xFFF3F4F6)),
                      ),
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    NavigationDrawerDestination(
                      icon: SvgPicture.asset('icons/deselected/stats_d.svg'),
                      selectedIcon:
                          SvgPicture.asset('icons/selected/stats.svg'),
                      label: const Text(Strings.stats),
                    ),
                    NavigationDrawerDestination(
                      icon: SvgPicture.asset('icons/deselected/cases_d.svg'),
                      selectedIcon:
                          SvgPicture.asset('icons/selected/cases.svg'),
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
                      const AccountAppbar(),
                      Expanded(child: pages[_selectedIndex]),
                    ],
                  ),
                ),
              ],
            ),
            orElse: () {
              return const Placeholder();
            },
          );
        }),
      ),
    );
  }
}
