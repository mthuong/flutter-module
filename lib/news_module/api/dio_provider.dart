import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobile_cross_platform/news_module/api/platform_headers.dart';
import 'package:mobile_cross_platform/news_module/channel/news_channel.dart';

class DioProvider {
  static Dio instance() {
    final dio = Dio();

//    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(HttpLogInterceptor());

    return dio;
  }
}

class HttpLogInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final headers = await NewsPlatformChannel.platform
        .invokeMapMethod(NewsPlatformMethod.getHeader);

    if (headers != null) {
      options.headers[PlatformHeaders.apiKey] = headers[PlatformHeaders.apiKey];
      options.headers[PlatformHeaders.appVersion] =
          headers[PlatformHeaders.appVersion];
      options.headers[PlatformHeaders.cacheControl] =
          headers[PlatformHeaders.cacheControl];
      options.headers[PlatformHeaders.contentType] =
          headers[PlatformHeaders.contentType];
      options.headers[PlatformHeaders.device] = headers[PlatformHeaders.device];
      options.headers[PlatformHeaders.deviceDescription] =
          headers[PlatformHeaders.deviceDescription];
      options.headers[PlatformHeaders.deviceId] =
          headers[PlatformHeaders.deviceId];
      options.headers[PlatformHeaders.locale] = headers[PlatformHeaders.locale];
      options.headers[PlatformHeaders.nonce] = headers[PlatformHeaders.nonce];
      options.headers[PlatformHeaders.signature] =
          headers[PlatformHeaders.signature];
    }
    log(
      'onRequest: ${options.uri}\n'
      'data=${options.data}\n'
      'method=${options.method}\n'
      'headers=${options.headers}\n'
      'queryParameters=${options.queryParameters}',
    );

    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    log('onResponse: $response');
    return handler.next(response);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    log(
      'onError: $err\n'
      'Response: ${err.response}',
    );
    return handler.next(err);
  }
}
