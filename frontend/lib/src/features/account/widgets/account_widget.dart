import 'package:flutter/material.dart';
import 'package:frontend/src/api/models/portfolio_wrapper.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({
    Key? key,
    required this.accountcase,
  }) : super(key: key);

  final PortfolioWrapper accountcase;

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
                accountcase.name,
                style: const TextStyle(
                  color: AppPalette.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  height: 0.04,
                ),
              ),
              const Spacer(),
              Text(
                '${accountcase.money} ₽',
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
            '*${accountcase.numberEnd}',
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
