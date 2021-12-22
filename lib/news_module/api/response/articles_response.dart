import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_entity.dart';

part 'articles_response.g.dart';

@JsonSerializable()
class ArticlesResponse {
  @JsonKey(
    name: 'articles',
    defaultValue: [],
  )
  List<ArticleEntity>? articles;

  ArticlesResponse();

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ArticlesResponseToJson(this);
}
