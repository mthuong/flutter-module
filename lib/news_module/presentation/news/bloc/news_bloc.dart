import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:mobile_cross_platform/news_module/model/article.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_entity.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ArticlesRepository articlesRepository;

  NewsBloc({
    required this.articlesRepository,
  }) : super(NewsLoading()) {
    on<NewsEvent>(_onEvent);
  }

  Future<void> _onEvent(NewsEvent event, Emitter<NewsState> emit) async {
    if (event is LoadNews) {
      await _loadArticles(emit);
    } else if (event is RefreshNews) {
      emit(NewsLoading());
      await _loadArticles(emit);
    }

    // await event.map(
    //   authCheckRequested: (e) async {
    //     final userOption = await _authFacade.getSignedInUserId();
    //     emit(userOption.fold(
    //       () => const AuthState.unauthenticated(),
    //       (_) => const AuthState.authenticated(),
    //     ));
    //   },
    //   signedOut: (e) async {
    //     await _authFacade.signOut();
    //     emit(const AuthState.unauthenticated());
    //   },
  }

  Future<void> _loadArticles(Emitter<NewsState> emit) async {
    try {
      final response = await articlesRepository.loadArticles();
      emit(NewsLoaded(response));
    } catch (e) {
      log('e: ${e.toString()}');
      emit(NewsNotLoaded(e.toString()));
    }
  }
}
