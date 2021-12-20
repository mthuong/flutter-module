import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:mobile_cross_platform/news_module/repositories/article/core/article_entity.dart';

part 'article.g.dart';

@JsonSerializable()
@immutable
class Article {
  final String title;
  final String description;
  final String date;
  final String? link;
  final String source;
  final String? banner;
  final String? tags;

  const Article({
    required this.title,
    required this.description,
    required this.date,
    this.link,
    required this.source,
    this.banner,
    this.tags,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  ArticleEntity toEntity() {
    return ArticleEntity.fromJson(toJson());
  }

  static Article fromEntity(ArticleEntity entity) {
    return Article(
      title: entity.title,
      description: entity.description,
      date: entity.date,
      link: entity.link,
      source: entity.source,
      banner: entity.banner,
      tags: entity.tags,
    );
  }
}
