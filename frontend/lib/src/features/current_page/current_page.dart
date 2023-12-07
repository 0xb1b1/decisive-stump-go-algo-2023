import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/src/features/account/account_page.dart';
import 'package:frontend/src/features/cases/case_details.dart';
import 'package:frontend/src/features/new_case/new_case_page.dart';
import '../../common/strings.dart';
import '../../common/theme/colors/app_palette.dart';
import '../cases/cases_page.dart';
import '../cases/models/case.dart';
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
    NewCasePage(),
    AccountPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.greyBg,
      body: Row(
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
              const SizedBox(
                height: 15,
              ),
              SvgPicture.asset('img/divider.svg'),
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
                selectedIcon: SvgPicture.asset('icons/selected/new_case.svg'),
                label: const Text(Strings.newCase),
              ),
              NavigationDrawerDestination(
                icon: SvgPicture.asset('icons/deselected/account_d.svg'),
                selectedIcon: SvgPicture.asset('icons/selected/account.svg'),
                label: const Text(Strings.myAccount),
              ),
            ],
          ),
          Expanded(child: pages[_selectedIndex]),
        ],
      ),
    );
  }
}
