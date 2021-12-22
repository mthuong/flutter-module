import 'package:flutter/material.dart';
import 'package:mobile_cross_platform/news_module/presentation/news/news.dart';

class AppRouter {
  static const String news = '/news';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case news:
        return MaterialPageRoute(
          builder: (BuildContext context) => const NewsScreen(),
        );
      // case SHOW_INFO:
      //   var show = settings.arguments as Show;
      //   return MaterialPageRoute(builder: (_) => ShowInfoScreen(show: show));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
