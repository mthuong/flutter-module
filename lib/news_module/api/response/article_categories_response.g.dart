// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleCategoryResponse _$ArticleCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    ArticleCategoryResponse(
      categories: (json['article_categories'] as List<dynamic>?)
              ?.map((e) =>
                  ArticleCategoryEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ArticleCategoryResponseToJson(
        ArticleCategoryResponse instance) =>
    <String, dynamic>{
      'article_categories': instance.categories,
    };
