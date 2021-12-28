import 'dart:core';

import 'package:mobile_cross_platform/news_module/api/articles_service.dart';
import 'package:mobile_cross_platform/news_module/api/request/article_category_request.dart';
import 'package:mobile_cross_platform/news_module/api/request/article_type_query.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_category.dart';
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
  Future<List<ArticleEntity>> loadArticles({required int page}) async {
    final response = await articlesService.getArticles(
      page: page,
      type: NewsTypeQuery(NewsType.latest),
    );

    return response.articles ?? [];
  }

  @override
  Future<List<ArticleCategoryEntity>> loadArticleCategories() async {
    final response = await articlesService.getArticleCategories();

    return response.categories ?? [];
  }

  @override
  Future updateArticleCategories({
    required List<ArticleCategoryEntity> categories,
  }) {
    final request = ArticleCategoryRequest(categories: categories);
    return articlesService.postArticleCategories(request);
  }
}
