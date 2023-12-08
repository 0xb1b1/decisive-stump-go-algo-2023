import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/api/models/article_list.dart';
import 'package:frontend/src/features/stats/widgets/news_card.dart';

import '../../../common/strings.dart';
import '../../../common/theme/text/app_typography.dart';

class NewsBlock extends StatefulWidget {
  final ArticleList newsList;
  final Future<void> Function(String) onNewsTap;

  const NewsBlock({
    required this.newsList,
    required this.onNewsTap,
    Key? key,
  }) : super(key: key);

  @override
  State<NewsBlock> createState() => _NewsBlockState();
}

class _NewsBlockState extends State<NewsBlock> {
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
        const Text(
          Strings.news,
          style: AppTypography.sectionTitle,
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            itemCount: widget.newsList.articles.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () =>
                        widget.onNewsTap(widget.newsList.articles[index].link),
                    child: NewsCard(news: widget.newsList.articles[index]),
                  ),
                  if (index != widget.newsList.articles.length - 1)
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
