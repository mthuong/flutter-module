part of 'filter_news_bloc.dart';

enum FilterNewsStatus {
  initial,
  loading,
  success,
  failure,
  confirmingUpdateStatus,
  updatedFilterSuccess,
}

class FilterNewsState {
  final FilterNewsStatus status;
  final List<ArticleCategoryEntity> categories;

  const FilterNewsState({
    this.status = FilterNewsStatus.initial,
    this.categories = const <ArticleCategoryEntity>[],
  });

  FilterNewsState copyWith({
    FilterNewsStatus? status,
    List<ArticleCategoryEntity>? categories,
  }) {
    return FilterNewsState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
    );
  }

  @override
  String toString() {
    return '''FilterNewsState { status: $status, categories: ${categories.length} }''';
  }

  List<Object> get props => [status, categories];
}
