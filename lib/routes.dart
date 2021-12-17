import 'package:flutter/widgets.dart';
import 'package:mobile_cross_platform/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  ROUTE.home.value: (BuildContext context) => MyHomePage(
        title: AppLocalizations.of(context)!.news,
      ),
};

enum ROUTE {
  home,
}

extension RouteExtension on ROUTE {
  String get value {
    switch (this) {
      case ROUTE.home:
        return '/home';
      default:
        return '/home';
    }
  }
}
