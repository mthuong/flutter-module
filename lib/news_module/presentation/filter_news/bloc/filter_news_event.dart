part of 'filter_news_bloc.dart';

abstract class FilterNewsEvent extends Equatable {
  const FilterNewsEvent();

  @override
  List<Object> get props => [];
}

class FetchFilterNews extends FilterNewsEvent {}

class UpdateFilterStatus extends FilterNewsEvent {
  final ArticleCategoryEntity category;

  const UpdateFilterStatus({
    required this.category,
  });
}

class ClearFilterEvent extends FilterNewsEvent {}

class ConfirmUpdateFilterEvent extends FilterNewsEvent {}
