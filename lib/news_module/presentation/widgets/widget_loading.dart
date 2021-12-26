import 'package:flutter/material.dart';
import 'package:mobile_cross_platform/gen/assets.gen.dart';

class WidgetLoading extends StatelessWidget {
  const WidgetLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(bottom: safePadding),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Center(
        child: Assets.images.hakoLoader.image(fit: BoxFit.cover),
      ),
    );
  }
}
