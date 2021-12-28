import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_cross_platform/app/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_cross_platform/news_module/api/articles_service.dart';
import 'package:mobile_cross_platform/news_module/api/dio_provider.dart';
import 'package:mobile_cross_platform/news_module/api/endpoints.dart';
import 'package:mobile_cross_platform/news_module/presentation/filter_news/bloc/filter_news_bloc.dart';
import 'package:mobile_cross_platform/news_module/presentation/news/bloc/bloc.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/article_repository_impl.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_repository.dart';
import 'package:mobile_cross_platform/theme/theme.dart';

import 'app_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Flutter Module',
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: AppRouter.news,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }

  static Widget runWidget(BuildContext context) {
    final config = AppConfig.of(context);
    final endpoint = config?.endpointType ?? EndPointType.production;

    WidgetsFlutterBinding.ensureInitialized();

    final dio = DioProvider.instance();
    var articleService = ArticlesService(
      dio,
      baseUrl: ENDPOINTS.news.data(type: endpoint),
    );
    final ArticlesRepository articleRepository = ArticleRepositoryImpl(
      articlesService: articleService,
    );

    final filterBloc = FilterNewsBloc(articlesRepository: articleRepository);
    final newsBloc = NewsBloc(
      articlesRepository: articleRepository,
      filterBloc: filterBloc,
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ArticlesRepository>(
          create: (context) => articleRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => newsBloc..add(RefreshNews()),
          ),
          BlocProvider(
            create: (context) => filterBloc..add(FetchFilterNews()),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}
