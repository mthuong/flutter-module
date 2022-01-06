import 'package:flutter/material.dart';
import 'package:mobile_cross_platform/theme/fonts.dart';

class WidgetEmpty extends StatelessWidget {
  final Image image;
  final String title;
  final String description;

  const WidgetEmpty({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image,
            const Padding(
              padding: EdgeInsets.only(top: 16),
            ),
            Text(
              title,
              style: Style.semibold_16,
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
            ),
            Text(
              description,
              style: Style.regular_16,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
