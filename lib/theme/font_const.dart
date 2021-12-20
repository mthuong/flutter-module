import 'package:flutter/material.dart';
import 'package:mobile_cross_platform/gen/fonts.gen.dart';

class FontConst {
  static get regular {
    return const TextStyle(
      fontFamily: FontFamily.sFProText,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  static get medium {
    return const TextStyle(
      fontFamily: FontFamily.sFProText,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
  }

  static get semibold {
    return const TextStyle(
      fontFamily: FontFamily.sFProText,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }

  // REGULAR
  // static final REGULAR_DEFAULT = REGULAR.copyWith(color: COLOR_CONST.DEFAULT);
  // static final REGULAR_DEFAULT_10 = REGULAR_DEFAULT.copyWith(fontSize: 10);
  // static final REGULAR_DEFAULT_12 = REGULAR_DEFAULT.copyWith(fontSize: 12);
}
