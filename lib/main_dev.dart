import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_cross_platform/app/app.dart';
import 'package:mobile_cross_platform/news_module/api/endpoints.dart';

import 'app/app_config.dart';
import 'app/simple_bloc_observer.dart';

void main() {
  stagingMain();
}

@pragma('vm:entry-point')
void stagingMain() {
  BlocOverrides.runZoned(
    () {
      runApp(
        AppConfig(
          endpointType: EndPointType.staging,
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
