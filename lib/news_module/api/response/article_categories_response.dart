import 'package:json_annotation/json_annotation.dart';

import 'package:mobile_cross_platform/news_module/repositories/article/core/article_category.dart';

part 'article_categories_response.g.dart';

@JsonSerializable()
class ArticleCategoryResponse {
  @JsonKey(name: 'article_categories', defaultValue: [])
  final List<ArticleCategoryEntity>? categories;

  ArticleCategoryResponse({
    this.categories,
  });

  factory ArticleCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleCategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleCategoryResponseToJson(this);
}
