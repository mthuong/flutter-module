import 'dart:core';

import 'article_entity.dart';

/// A class that Loads articles. The data layer of the app.
///
/// The domain layer should depend on this abstract class, and each app can
/// inject the correct implementation depending on the environment
abstract class ArticlesRepository {
  Future<List<ArticleEntity>> loadArticles();

  // TODO: Load article detail
}
