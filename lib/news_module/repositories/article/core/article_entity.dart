import 'package:json_annotation/json_annotation.dart';

part 'article_entity.g.dart';

@JsonSerializable()
class ArticleEntity {
  final String title;
  final String description;
  final String date;
  final String? link;
  final String source;
  final String? banner;
  final String? tags;

  ArticleEntity({
    required this.title,
    required this.description,
    required this.date,
    this.link,
    required this.source,
    this.banner,
    this.tags,
  });

  factory ArticleEntity.fromJson(Map<String, dynamic> json) =>
      _$ArticleEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleEntityToJson(this);
}
