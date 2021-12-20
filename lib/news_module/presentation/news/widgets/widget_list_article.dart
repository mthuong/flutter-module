import 'package:flutter/material.dart';

import 'package:mobile_cross_platform/news_module/presentation/widgets/widget_spacer.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_entity.dart';

class WidgetListArticle extends StatefulWidget {
  final List<ArticleEntity> items;

  const WidgetListArticle({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  _WidgetListArticleState createState() => _WidgetListArticleState();
}

class _WidgetListArticleState extends State<WidgetListArticle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return _ItemWidgetArticle(article: widget.items[index]);
        },
        separatorBuilder: (context, index) {
          return const WidgetSpacer(height: 20);
        },
        itemCount: widget.items.length,
      ),
    );
  }
}

class _ItemWidgetArticle extends StatelessWidget {
  final ArticleEntity article;

  const _ItemWidgetArticle({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(
              article.banner ?? '',
              width: 90,
              height: 90,
            ),
          ),
          const WidgetSpacer(width: 14),
        ],
      ),
    );
  }
}
