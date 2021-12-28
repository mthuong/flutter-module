import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_category.dart';

part 'article_category_request.freezed.dart';
part 'article_category_request.g.dart';

@freezed
class ArticleCategoryRequest with _$ArticleCategoryRequest {
  factory ArticleCategoryRequest({
    @JsonKey(name: 'article_categories')
        required List<ArticleCategoryEntity> categories,
  }) = _ArticleCategoryRequest;

  factory ArticleCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$ArticleCategoryRequestFromJson(json);
}
