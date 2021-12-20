import 'dart:core';

import 'package:mobile_cross_platform/news_module/api/articles_service.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_entity.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_repository.dart';

/// A class that implement API with http client. It has a
/// clear responsibility: Get Articles from server
class ArticleRepositoryImpl implements ArticlesRepository {
  final ArticlesService articlesService;

  const ArticleRepositoryImpl({
    required this.articlesService,
  });

  @override
  Future<List<ArticleEntity>> loadArticles() async {
    final response = await articlesService.getArticles();

    return response.articles ?? [];
  }
}
