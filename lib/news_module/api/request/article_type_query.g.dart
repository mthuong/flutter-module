// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_type_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsTypeQuery _$NewsTypeQueryFromJson(Map<String, dynamic> json) =>
    NewsTypeQuery(
      $enumDecode(_$NewsTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$NewsTypeQueryToJson(NewsTypeQuery instance) =>
    <String, dynamic>{
      'type': _$NewsTypeEnumMap[instance.type],
    };

const _$NewsTypeEnumMap = {
  NewsType.trending: 'trending_news',
  NewsType.latest: 'latest_news',
};
