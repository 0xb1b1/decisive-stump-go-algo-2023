import 'package:flutter/material.dart';
import 'package:frontend/src/common/theme/border_radius/border_radius.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';
import 'package:frontend/src/features/account/account_cubit.dart';

class CardsBlock extends StatefulWidget {
  final List<AccountCard> cards;
  final Function(int) onCadrTap;
  final int selectedId;

  const CardsBlock({
    Key? key,
    required this.cards,
    required this.onCadrTap,
    required this.selectedId,
  }) : super(key: key);

  @override
  State<CardsBlock> createState() => _NewsBlockState();
}

class _NewsBlockState extends State<CardsBlock> {
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
          height: 180,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            itemCount: widget.cards.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () => widget.onCadrTap(index),
                    child: CaseCard(accountcard: widget.cards[index], isSelected: widget.selectedId == index),
                  ),
                  if (index != widget.cards.length - 1)
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
  final AccountCard accountcard;
  final bool isSelected;

  const CaseCard({
    Key? key,
    required this.accountcard,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      height: 200,
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
            '*${accountcard.numberEnd}',
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF14161C),
              fontSize: 50,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 14),
          Text(
            accountcard.name,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF14161C),
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
