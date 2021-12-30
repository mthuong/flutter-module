import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_cross_platform/app/app.dart';
import 'package:mobile_cross_platform/news_module/api/endpoints.dart';

import 'app/app_config.dart';
import 'app/simple_bloc_observer.dart';

void main() {
  productionMain();
}

@pragma('vm:entry-point')
void productionMain() {
  BlocOverrides.runZoned(
    () {
      runApp(
        AppConfig(
          // ignore: fixme
          // FIXME: Hardcode staging endpoint for default entry. We will resolve this issue when implement Flutter Engine Group API
          endpointType: EndPointType.production,
          child: Builder(
            builder: (context) {
              return MyApp.runWidget(context);
            },
          ),
        ),
      );
    },
    blocObserver: SimpleBlocObserver(),
  );
}
