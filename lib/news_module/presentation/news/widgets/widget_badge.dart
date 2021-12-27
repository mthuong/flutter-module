import 'package:flutter/material.dart';
import 'package:mobile_cross_platform/theme/fonts.dart';
import 'package:mobile_cross_platform/theme/theme.dart';

class WidgetBadge extends StatelessWidget {
  final int? badge;
  const WidgetBadge({
    Key? key,
    this.badge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (badge == null || badge! <= 0) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).own().colors.swBg,
      ),
      child: Center(
        child: Text(
          badge!.toString(),
          style: Style.semibold.copyWith(),
        ),
      ),
    );
  }
}
