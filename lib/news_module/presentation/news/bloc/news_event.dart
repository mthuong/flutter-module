part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class LoadNews extends NewsEvent {}

class RefreshNews extends NewsEvent {}

class GotoNewsDetail extends NewsEvent {
  final Article article;

  GotoNewsDetail({
    required this.article,
  });
}
