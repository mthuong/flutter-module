import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:mobile_cross_platform/news_module/presentation/filter_news/bloc/filter_news_bloc.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_entity.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_repository.dart';
import 'package:mobile_cross_platform/utils/utils.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ArticlesRepository articlesRepository;
  final FilterNewsBloc filterBloc;
  StreamSubscription<FilterNewsState>? _filterSubscription;

  NewsBloc({
    required this.articlesRepository,
    required this.filterBloc,
  }) : super(const NewsState()) {
    on<LoadNews>(
      _onEvent,
      transformer: debounceDroppable(),
    );
    on<RefreshNews>(
      _onRefreshEvent,
      transformer: debounceDroppable(),
    );

    _filterSubscription = filterBloc.stream.listen(_onFilterStateChanged);
  }

  void _onFilterStateChanged(FilterNewsState? state) {
    if (state != null &&
        state.status == FilterNewsStatus.updatedFilterSuccess) {
      add(RefreshNews());
    }
  }

  @override
  Future<void> close() {
    if (_filterSubscription != null) {
      _filterSubscription!.cancel();
    }
    return super.close();
  }

  Future<void> _onRefreshEvent(
    RefreshNews event,
    Emitter<NewsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: NewsStatus.refresh,
        page: 1,
        hasReachedMax: false,
      ),
    );

    await _onEvent(event, emit);
  }

  Future<void> _onEvent(NewsEvent event, Emitter<NewsState> emit) async {
    log('event: ${event.toString()}');

    if (state.hasReachedMax) return;
    try {
      if (state.status == NewsStatus.loading ||
          state.status == NewsStatus.refresh) {
        int page = state.page;
        final articles = await articlesRepository.loadArticles(page: page);
        log(
          'articles: ${articles.length} = ${state.articles.length} + ${articles.length}',
        );
        return emit(
          NewsState(
            status: NewsStatus.success,
            articles: articles,
            hasReachedMax: false,
            page: page,
          ),
        );
      }

      int page = state.page + 1;
      final articles = await articlesRepository.loadArticles(page: page);
      if (articles.isEmpty) {
        emit(state.copyWith(hasReachedMax: true));
      } else {
        final allArticles = List.of(state.articles)..addAll(articles);
        log(
          'articles: ${allArticles.length} = ${state.articles.length} + ${articles.length}',
        );

        emit(
          state.copyWith(
            status: NewsStatus.success,
            articles: allArticles,
            hasReachedMax: false,
            page: page,
          ),
        );
      }
    } catch (_) {
      emit(state.copyWith(status: NewsStatus.failure));
    }
  }
}
