import 'package:flutter/material.dart';
import 'package:mobile_cross_platform/gen/fonts.gen.dart';

extension Style on FontFamily {
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

  static get semibold_16 {
    return semibold.copyWith(fontSize: 16.0);
  }

  static get semibold_22 {
    return semibold.copyWith(fontSize: 22.0);
  }

  // REGULAR
  // static final REGULAR_DEFAULT = REGULAR.copyWith(color: COLOR_CONST.DEFAULT);
  // static final REGULAR_DEFAULT_10 = REGULAR_DEFAULT.copyWith(fontSize: 10);
  // static final REGULAR_DEFAULT_12 = REGULAR_DEFAULT.copyWith(fontSize: 12);

}
