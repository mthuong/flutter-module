import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:mobile_cross_platform/news_module/repositories/article/core/article_category.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_repository.dart';
import 'package:mobile_cross_platform/utils/utils.dart';

part 'filter_news_event.dart';
part 'filter_news_state.dart';

class FilterNewsBloc extends Bloc<FilterNewsEvent, FilterNewsState> {
  final ArticlesRepository articlesRepository;

  FilterNewsBloc({
    required this.articlesRepository,
  }) : super(const FilterNewsState()) {
    on<FetchFilterNews>(
      _onFetchFilterNews,
      transformer: debounceDroppable(),
    );
    on<UpdateFilterStatus>(
      _onUpdateFilterStatus,
      transformer: debounceDroppable(),
    );
    on<ClearFilterEvent>(
      _onClearFilterEvent,
      transformer: debounceDroppable(),
    );
    on<ConfirmUpdateFilterEvent>(
      _onConfirmUpdateFilterEvent,
      transformer: debounceDroppable(),
    );
  }

  Future<void> _onFetchFilterNews(
    FetchFilterNews event,
    Emitter<FilterNewsState> emit,
  ) async {
    try {
      final categories = await articlesRepository.loadArticleCategories();
      emit(
        FilterNewsState(
          categories: categories,
          status: FilterNewsStatus.success,
        ),
      );
    } catch (e) {
      log('_onFetchFilterNews ${e.toString()}');
      emit(
        const FilterNewsState(status: FilterNewsStatus.failure),
      );
    }
  }

  Future<void> _onUpdateFilterStatus(
    UpdateFilterStatus event,
    Emitter<FilterNewsState> emit,
  ) async {
    try {
      final category = event.category;
      List<ArticleCategoryEntity> updatedCategories =
          state.categories.map((element) {
        return element.id == category.id ? category : element;
      }).toList();
      emit(
        state.copyWith(categories: updatedCategories),
      );
    } catch (e) {
      log('_onUpdateFilterStatus ${e.toString()}');
    }
  }

  Future<void> _onClearFilterEvent(
    ClearFilterEvent event,
    Emitter<FilterNewsState> emit,
  ) async {
    try {
      List<ArticleCategoryEntity> updatedCategories =
          state.categories.map((element) {
        final category = element.copyWith(isChecked: false);
        return category;
      }).toList();
      emit(
        state.copyWith(categories: updatedCategories),
      );
    } catch (e) {
      log('_onClearFilterEvent ${e.toString()}');
    }
  }

  Future<void> _onConfirmUpdateFilterEvent(
    ConfirmUpdateFilterEvent event,
    Emitter<FilterNewsState> emit,
  ) async {
    try {
      // Show loading
      emit(state.copyWith(status: FilterNewsStatus.confirmingUpdateStatus));

      // Call api to update filter
      await articlesRepository.updateArticleCategories(
        categories: state.categories,
      );

      // Pop the screen
      emit(state.copyWith(status: FilterNewsStatus.updatedFilterSuccess));
      emit(state.copyWith(status: FilterNewsStatus.success));
    } catch (e) {
      log('_onClearFilterEvent ${e.toString()}');
    }
  }
}
