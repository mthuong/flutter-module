// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      title: json['title'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      link: json['link'] as String?,
      source: json['source'] as String,
      banner: json['banner'] as String?,
      tags: json['tags'] as String?,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'date': instance.date,
      'link': instance.link,
      'source': instance.source,
      'banner': instance.banner,
      'tags': instance.tags,
    };
