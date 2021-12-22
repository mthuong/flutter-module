part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class LoadNews extends NewsEvent {
  LoadNews();
}

class RefreshNews extends NewsEvent {}

class GotoNewsDetail extends NewsEvent {
  final ArticleEntity article;

  GotoNewsDetail({
    required this.article,
  });
}
