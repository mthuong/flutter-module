import 'package:flutter/material.dart';

class WidgetSpacer extends StatelessWidget {
  final double? height;
  final double? width;
  const WidgetSpacer({
    Key? key,
    this.width,
    this.height = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
