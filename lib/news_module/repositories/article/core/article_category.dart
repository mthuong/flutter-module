import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'article_category.g.dart';

@JsonSerializable()
class ArticleCategoryEntity {
  final int id;
  final String name;
  @JsonKey(name: 'logo_url')
  final String logoUrl;
  @JsonKey(name: 'is_checked', defaultValue: false)
  final bool isChecked;
  @JsonKey(name: 'category_type')
  final String categoryType;

  ArticleCategoryEntity({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.isChecked,
    required this.categoryType,
  });

  factory ArticleCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$ArticleCategoryEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleCategoryEntityToJson(this);
}
