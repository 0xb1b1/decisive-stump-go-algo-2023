import 'package:flutter/material.dart';
import 'package:frontend/src/api/models/article.dart';
import 'package:frontend/src/common/theme/colors/app_palette.dart';
import 'package:frontend/src/common/theme/text/app_typography.dart';
import 'package:intl/intl.dart';

import '../../../common/theme/border_radius/border_radius.dart';

class NewsCard extends StatelessWidget {
  final Article news;

  const NewsCard({
    required this.news,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      height: 240,
      width: 346,
      decoration: BoxDecoration(
        color: AppPalette.white,
        borderRadius: BorderRadius.circular(mediumRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SourceTag(source: news.source),
          const SizedBox(
            height: 24,
          ),
          Text(
            news.title,
            style: AppTypography.sectionTitle,
          ),
          const Expanded(
            child: SizedBox(
              width: 10,
            ),
          ),
          Text(
            DateFormat('dd.MM.yyyy – HH:mm').format(news.timestamp),
            style: AppTypography.regularBlack.copyWith(
              color: AppPalette.greyText,
            ),
          )
        ],
      ),
    );
  }
}

class SourceTag extends StatelessWidget {
  final String source;

  const SourceTag({
    required this.source,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: AppPalette.greyBg,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(source),
    );
  }
}
