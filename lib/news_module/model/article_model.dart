import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  final int id;
  final String name;
  @JsonKey(name: 'logo_url')
  final String logoUrl;
  @JsonKey(name: 'is_checked')
  final bool isChecked;
  @JsonKey(name: 'category_type')
  final String categoryType;

  ArticleModel(
    this.id,
    this.name,
    this.logoUrl,
    this.isChecked,
    this.categoryType,
  );

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
