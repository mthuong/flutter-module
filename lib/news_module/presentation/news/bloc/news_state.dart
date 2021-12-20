part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<ArticleEntity> articles;

  const NewsLoaded(
    this.articles,
  );

  @override
  List<Object> get props {
    return [articles];
  }

  @override
  String toString() {
    return 'HomeLoaded{response: $articles}';
  }
}

class NewsNotLoaded extends NewsState {
  final String e;

  const NewsNotLoaded(this.e);

  @override
  String toString() {
    return 'HomeNotLoaded{e: $e}';
  }
}
