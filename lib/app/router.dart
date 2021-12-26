import 'package:flutter/material.dart';
import 'package:mobile_cross_platform/news_module/presentation/filter_news/sc_filter_news.dart';
import 'package:mobile_cross_platform/news_module/presentation/news/sc_news.dart';
import 'package:mobile_cross_platform/news_module/presentation/news_detail/sc_news_detail.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_entity.dart';

class AppRouter {
  static const String news = '/';
  static const String newsDetail = '/news_detail';
  static const String newsFilter = '/news_filter';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case news:
        return MaterialPageRoute(
          builder: (BuildContext context) => const NewsScreen(),
        );

      case newsDetail:
        var article = settings.arguments as ArticleEntity;
        return MaterialPageRoute(
          builder: (_) => NewsDetailScreen(article: article),
        );

      case newsFilter:
        return MaterialPageRoute(
          builder: (_) => const FilterNewsScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
