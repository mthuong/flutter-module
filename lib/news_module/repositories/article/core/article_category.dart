// import 'package:json_annotation/json_annotation.dart';

// part 'article_category.g.dart';

// @JsonSerializable()
// class ArticleCategoryEntity {
//   final int id;
//   final String name;
//   @JsonKey(name: 'logo_url')
//   final String logoUrl;
//   @JsonKey(name: 'is_checked', defaultValue: false)
//   final bool isChecked;
//   @JsonKey(name: 'category_type')
//   final String categoryType;

//   ArticleCategoryEntity({
//     required this.id,
//     required this.name,
//     required this.logoUrl,
//     required this.isChecked,
//     required this.categoryType,
//   });

//   factory ArticleCategoryEntity.fromJson(Map<String, dynamic> json) =>
//       _$ArticleCategoryEntityFromJson(json);
//   Map<String, dynamic> toJson() => _$ArticleCategoryEntityToJson(this);
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_category.freezed.dart';
part 'article_category.g.dart';

@freezed
class ArticleCategoryEntity with _$ArticleCategoryEntity {
  factory ArticleCategoryEntity({
    required int id,
    required String name,
    @JsonKey(name: 'logo_url') required String logoUrl,
    @Default(false) @JsonKey(name: 'is_checked') bool isChecked,
    @JsonKey(name: 'category_type') required String categoryType,
  }) = _ArticleCategoryEntity;

  factory ArticleCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$ArticleCategoryEntityFromJson(json);
}
