import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/border_radius/border_radius.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';
import 'package:frontend/src/features/account/account_cubit.dart';

class CasesBlock extends StatefulWidget {
  final List<AccountCase> cases;
  final Function(int) onCaseTap;
  final int selectedId;

  const CasesBlock({
    Key? key,
    required this.cases,
    required this.onCaseTap,
    required this.selectedId,
  }) : super(key: key);

  @override
  State<CasesBlock> createState() => _NewsBlockState();
}

class _NewsBlockState extends State<CasesBlock> {
  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 1086,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 1086,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            itemCount: widget.cases.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () => widget.onCaseTap(index),
                    child: CaseCard(accountcase: widget.cases[index], isSelected: widget.selectedId == index),
                  ),
                  if (index != widget.cases.length - 1)
                    const SizedBox(
                      width: 24,
                    ),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_left),
              onPressed: _scrollLeft,
            ),
            const SizedBox(
              width: 8,
            ),
            IconButton(
              icon: const Icon(Icons.arrow_right),
              onPressed: _scrollRight,
            ),
          ],
        ),
      ],
    );
  }
}

class CaseCard extends StatelessWidget {
  final AccountCase accountcase;
  final bool isSelected;

  const CaseCard({
    Key? key,
    required this.accountcase,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      height: 186,
      width: 346,
      decoration: BoxDecoration(
        color: isSelected ? AppPalette.mainBlue : AppPalette.white,
        borderRadius: BorderRadius.circular(mediumRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${accountcase.money} ₽',
            style: TextStyle(
              color: isSelected ? Colors.white : Color(0xFF14161C),
              fontSize: 50,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 14),
          Text(
            accountcase.name,
            style: TextStyle(
              color: isSelected ? Colors.white : Color(0xFF14161C),
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 14),
          Text(
            '*${accountcase.numberEnd}',
            style: AppTypography.regularBlack.copyWith(
              color: isSelected ? AppPalette.greyText2 : AppPalette.greyText,
            ),
          ),
        ],
      ),
    );
  }
}
