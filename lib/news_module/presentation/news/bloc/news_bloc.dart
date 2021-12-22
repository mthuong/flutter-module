import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:mobile_cross_platform/news_module/repositories/article/core/article_entity.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

const throttleDuration = Duration(milliseconds: 1000);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

const debounceDuration = Duration(microseconds: 300);
EventTransformer<E> debounceDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.debounce(duration), mapper);
  };
}

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ArticlesRepository articlesRepository;

  NewsBloc({
    required this.articlesRepository,
  }) : super(const NewsState()) {
    on<NewsEvent>(
      _onEvent,
      transformer: debounceDroppable(debounceDuration),
    );
  }

  Future<void> _onEvent(NewsEvent event, Emitter<NewsState> emit) async {
    if (event is RefreshNews) {
      emit(
        const NewsState(
          page: 1,
          status: NewsStatus.initial,
        ),
      );
    }

    if (state.hasReachedMax) return;
    try {
      if (state.status == NewsStatus.initial) {
        int page = state.page;
        final articles = await articlesRepository.loadArticles(page: page);
        log(
          'articles: ${articles.length} = ${state.articles.length} + ${articles.length}',
        );
        return emit(
          state.copyWith(
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
