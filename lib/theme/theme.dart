import 'package:flutter/material.dart';
import 'package:mobile_cross_platform/gen/fonts.gen.dart';

import '../gen/colors.gen.dart';

/// Usage
/// ```dart
/// Theme.of(context).own().colors.error
/// ```

ThemeFields ownTheme(BuildContext context) => Theme.of(context).own();

extension ThemeDataExtensions on ThemeData {
  static final Map<InputDecorationTheme, ThemeFields> _own = {};

  void addOwn(ThemeFields own) {
    // can't use reference to ThemeData since Theme.of() can create a new localized instance from the original theme. Use internal fields, in this case InputDecoreationTheme reference which is not deep copied but simply a reference is copied
    _own[inputDecorationTheme] = own;
  }

  static ThemeFields? empty;

  ThemeFields own() {
    var o = _own[inputDecorationTheme];
    if (o == null) {
      empty ??= ThemeFields.empty();
      o = empty;
    }
    return o!;
  }
}

///********************
/// EDIT HERE
///********************

/// Add more color define here
class ThemeColor {
  final Color error;
  final Color coinBlueTitle;
  final Color coinSlateGray;
  final Color coinLineWhite;

  ThemeColor({
    required this.error,
    required this.coinBlueTitle,
    required this.coinSlateGray,
    required this.coinLineWhite,
  });
}

class ThemeFields {
  final ThemeColor colors;

  factory ThemeFields.empty() {
    return ThemeFields(
      colors: ThemeColor(
        error: const Color(0xFFFF0000),
        coinBlueTitle: const Color.fromRGBO(53, 64, 83, 1),
        coinSlateGray: const Color.fromRGBO(117, 128, 142, 1),
        coinLineWhite: const Color(0xFFEEF2F5),
      ),
    );
  }

  ThemeFields({
    required this.colors,
  });
}

// LightTheme
final ThemeData lightTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorName.white,
    elevation: 0,
    shadowColor: Colors.transparent,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontFamily: FontFamily.sFProText,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  ),
)..addOwn(
    ThemeFields(
      colors: ThemeColor(
        error: const Color(0xFFFF0000),
        coinBlueTitle: const Color.fromRGBO(53, 64, 83, 1),
        coinSlateGray: const Color.fromRGBO(117, 128, 142, 1),
        coinLineWhite: const Color(0xFFEEF2F5),
      ),
    ),
  );

// DarkTheme
final ThemeData darkTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorName.white,
    elevation: 0,
    shadowColor: Colors.transparent,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontFamily: FontFamily.sFProText,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  ),
)..addOwn(
    ThemeFields(
      colors: ThemeColor(
        error: const Color(0xFFFF0000),
        coinBlueTitle: const Color.fromRGBO(53, 64, 83, 1),
        coinSlateGray: const Color.fromRGBO(117, 128, 142, 1),
        coinLineWhite: const Color(0xFFEEF2F5),
      ),
    ),
  );