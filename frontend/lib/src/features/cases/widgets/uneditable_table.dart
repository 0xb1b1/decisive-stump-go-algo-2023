import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/src/features/cases/cubit/case_cubit.dart';

import '../../../common/strings.dart';
import '../../../common/theme/border_radius/border_radius.dart';
import '../../../common/theme/colors/app_palette.dart';
import '../../../common/theme/text/app_typography.dart';
import '../models/company.dart';

class UneditableTable extends StatelessWidget {
  final List<Company> companies;

  const UneditableTable({
    Key? key,
    required this.companies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppPalette.white,
        borderRadius: BorderRadius.circular(largeRadius),
      ),
      child: ListView.builder(
        itemCount: companies.length,
        itemBuilder: (context, index) {
          final company = companies[index];
          return Column(
            children: [
              const Divider(
                color: AppPalette.greyBg,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(company.title),
                  Text(
                    (company.income >= 0
                        ? "+${company.income}%"
                        : "${company.income}%"),
                    style: TextStyle(
                      color: company.income >= 0 ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
