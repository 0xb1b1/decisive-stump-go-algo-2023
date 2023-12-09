import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/features/search/cubit/search_cubit.dart';
import 'package:frontend/src/widgets/search_input.dart';

class AccountAppbar extends StatelessWidget {
  const AccountAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 48),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          SearchInput(
            onSearch: BlocProvider.of<SearchCubit>(context).getCompany,
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Активы',
                      style: TextStyle(
                        color: Color(0xFF898A8D),
                        fontSize: 7,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '10 500 500.44',
                      style: TextStyle(
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
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Счет',
                      style: TextStyle(
                        color: Color(0xFF898A8D),
                        fontSize: 7,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '15 000 000',
                      style: TextStyle(
                        color: Color(0xFF14161C),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
