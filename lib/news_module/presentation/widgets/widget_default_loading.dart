import 'package:flutter/material.dart';

class WidgetDefaultLoading extends StatelessWidget {
  const WidgetDefaultLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator.adaptive(strokeWidth: 1.5),
        ),
      ),
    );
  }
}
