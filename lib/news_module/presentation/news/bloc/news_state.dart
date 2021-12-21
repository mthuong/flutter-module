part of 'news_bloc.dart';

enum NewsStatus { initial, success, failure }

class NewsState extends Equatable {
  const NewsState({
    this.status = NewsStatus.initial,
    this.articles = const <ArticleEntity>[],
    this.hasReachedMax = false,
    this.page = 1,
  });

  final NewsStatus status;
  final List<ArticleEntity> articles;
  final bool hasReachedMax;
  final int page;

  NewsState copyWith({
    NewsStatus? status,
    List<ArticleEntity>? articles,
    bool? hasReachedMax,
    int? page,
  }) {
    return NewsState(
      status: status ?? this.status,
      articles: articles ?? this.articles,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }

  @override
  String toString() {
    return '''NewsState { status: $status, page: $page, hasReachedMax: $hasReachedMax, articles: ${articles.length} }''';
  }

  @override
  List<Object> get props => [status, page, articles, hasReachedMax];
}
