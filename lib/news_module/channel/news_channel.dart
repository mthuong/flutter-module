import 'package:flutter/services.dart';

class NewsPlatformChannel {
  static const _channelName = 'com.coinhako.mobile_cross_platform/data';

  static const platform = MethodChannel(_channelName);
}

class NewsPlatformMethod {
  static const getHeader = 'getHeader';
  static const hideBottomBar = 'hideBottomBar';
  static const showBottomBar = 'showBottomBar';

  /// Invoke openBrowser with argument
  /// param: argument
  static const openBrowser = 'openBrowser';
}
