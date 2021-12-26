import 'package:flutter/material.dart';
import 'package:mobile_cross_platform/theme/fonts.dart';

class WidgetNavTitle extends StatelessWidget {
  final String? title;
  const WidgetNavTitle({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: Style.semibold,
    );
  }
}
