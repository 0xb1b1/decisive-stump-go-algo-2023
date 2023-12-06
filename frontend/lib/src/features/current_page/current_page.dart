import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/features/current_page/current_page_cubit.dart';

import '../../common/strings.dart';
import '../../common/theme/colors/app_palette.dart';
import '../cases/case_page.dart';
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
    )
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
            children: const [
              NavigationDrawerDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text(Strings.stats),
              ),
              NavigationDrawerDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text(Strings.cases),
              )
            ],
          ),
          Expanded(child: pages[_selectedIndex]),
        ],
      ),
    );
  }
}
