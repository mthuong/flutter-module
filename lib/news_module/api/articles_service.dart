import 'package:mobile_cross_platform/news_module/api/apis.dart';
import 'package:mobile_cross_platform/news_module/api/response/articles_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

part 'articles_service.g.dart';

@RestApi(
  parser: Parser.FlutterCompute,
)
abstract class ArticlesService {
  factory ArticlesService(Dio dio, {required String baseUrl}) =
      _ArticlesService;

  @GET(Apis.articles)
  Future<ArticlesResponse> getArticles();
}

ArticlesResponse deserializeArticlesResponse(Map<String, dynamic> json) =>
    ArticlesResponse.fromJson(json);
