import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/features/current_page/%D1%81ubit/app_bar_cubit.dart';
import 'package:frontend/src/features/current_page/%D1%81ubit/app_bar_state.dart';
import 'package:frontend/src/widgets/search_input.dart';

class AccountAppbar extends StatelessWidget {
  final Future<void> Function(String) onSearch;

  const AccountAppbar({required this.onSearch, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 48),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          SearchInput(
            onSearch: onSearch,
          ),
          const Spacer(),
          Container(
            width: 220,
            height: 40,
            decoration: ShapeDecoration(
              color: const Color(0xFFF3F4F6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: BlocBuilder<AppBarCubit, AppBarState>(
              builder: (context, state) {
                return state.when(
                  data: (account, assets) => Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Активы',
                            style: TextStyle(
                              color: Color(0xFF898A8D),
                              fontSize: 7,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            assets.toStringAsFixed(2),
                            style: const TextStyle(
                              color: Color(0xFF1D823E),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 1,
                        height: 20,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF898A8D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Счёт',
                            style: TextStyle(
                              color: Color(0xFF898A8D),
                              fontSize: 7,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            account.toStringAsFixed(2),
                            style: const TextStyle(
                              color: Color(0xFF14161C),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
