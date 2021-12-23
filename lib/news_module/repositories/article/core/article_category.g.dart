// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleCategoryEntity _$ArticleCategoryEntityFromJson(
        Map<String, dynamic> json) =>
    ArticleCategoryEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      logoUrl: json['logo_url'] as String,
      isChecked: json['is_checked'] as bool? ?? false,
      categoryType: json['category_type'] as String,
    );

Map<String, dynamic> _$ArticleCategoryEntityToJson(
        ArticleCategoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_url': instance.logoUrl,
      'is_checked': instance.isChecked,
      'category_type': instance.categoryType,
    };
