import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_cross_platform/news_module/api/request/article_type_query.dart';
import 'package:mobile_cross_platform/news_module/api/response/article_categories_response.dart';
import 'package:retrofit/retrofit.dart';

import 'package:mobile_cross_platform/news_module/api/apis.dart';
import 'package:mobile_cross_platform/news_module/api/response/articles_response.dart';

part 'articles_service.g.dart';

@RestApi(
  parser: Parser.FlutterCompute,
)
abstract class ArticlesService {
  factory ArticlesService(Dio dio, {required String baseUrl}) =
      _ArticlesService;

  @GET(Apis.articles)
  Future<ArticlesResponse> getArticles({
    @Query('page') required int page,
    @Query('type') required NewsTypeQuery type,
  });

  @GET(Apis.articleCategories)
  Future<ArticleCategoryResponse> getArticleCategories();
}

ArticlesResponse deserializeArticlesResponse(Map<String, dynamic> json) =>
    ArticlesResponse.fromJson(json);
