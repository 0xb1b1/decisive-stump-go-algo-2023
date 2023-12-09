import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({
    Key? key,
    required this.name,
    required this.numberEnd,
    required this.money,
  }) : super(key: key);

  final String name;
  final int numberEnd;
  final int money;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 38),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: AppPalette.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  height: 0.04,
                ),
              ),
              const Spacer(),
              Text(
                '₽$money',
                style: const TextStyle(
                  color: AppPalette.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  // height: 0.04,
                ),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 12,
          // ),
          Text(
            '*$numberEnd',
            style: const TextStyle(
              color: AppPalette.greyText,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              // height: 0.07,
            ),
          ),
        ],
      ),
    );
  }
}
