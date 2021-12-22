import 'package:flutter/material.dart';
import 'package:mobile_cross_platform/gen/assets.gen.dart';

class WidgetBackButton extends StatelessWidget {
  const WidgetBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Assets.images.backArrow.image(
        color: Colors.black,
      ),
      onPressed: Navigator.of(context).pop,
    );
  }
}
