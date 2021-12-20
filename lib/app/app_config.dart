import 'package:flutter/material.dart';

import 'package:mobile_cross_platform/news_module/api/endpoints.dart';

class AppConfig extends InheritedWidget {
  const AppConfig({
    Key? key,
    required Widget child,
    required this.endpointType,
  }) : super(key: key, child: child);

  final EndPointType endpointType;

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
