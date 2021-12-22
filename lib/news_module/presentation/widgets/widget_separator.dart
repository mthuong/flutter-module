import 'package:flutter/material.dart';
import 'package:mobile_cross_platform/theme/theme.dart';

class WidgetSeparator extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  const WidgetSeparator({
    Key? key,
    this.width,
    this.height = 1,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (color == null) {}
    return SizedBox(
      height: height,
      width: width,
      child: Container(
        color: color ?? Theme.of(context).own().colors.coinLineWhite,
      ),
    );
  }
}
