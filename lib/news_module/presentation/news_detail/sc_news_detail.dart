import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:mobile_cross_platform/gen/assets.gen.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_entity.dart';

class NewsDetailScreen extends StatefulWidget {
  final ArticleEntity article;

  const NewsDetailScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _shareAction,
            icon: Assets.images.icNewsShare.image(
              width: 24,
              height: 24,
            ),
          ),
          IconButton(
            onPressed: _settingAction,
            icon: Assets.images.icNewsSetting.image(
              width: 24,
              height: 24,
            ),
          )
        ],
      ),
      body: Container(),
    );
  }

  void _shareAction() {}

  void _settingAction() {}
}
