import 'package:json_annotation/json_annotation.dart';

part 'article_type_query.g.dart';

enum NewsType {
  @JsonValue('trending_news')
  trending,
  @JsonValue('latest_news')
  latest,
}

@JsonSerializable()
class NewsTypeQuery {
  final NewsType type;

  NewsTypeQuery(
    this.type,
  );

  factory NewsTypeQuery.fromJson(Map<String, dynamic> json) =>
      _$NewsTypeQueryFromJson(json);
  Map<String, dynamic> toJson() => _$NewsTypeQueryToJson(this);
}

Map<String, dynamic> serializeNewsTypeQuery(NewsTypeQuery object) =>
    object.toJson();
