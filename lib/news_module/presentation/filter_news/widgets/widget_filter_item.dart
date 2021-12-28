import 'package:flutter/material.dart';

import 'package:mobile_cross_platform/gen/assets.gen.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_category.dart';
import 'package:mobile_cross_platform/theme/fonts.dart';

class WidgetFilterItem extends StatelessWidget {
  final ArticleCategoryEntity? category;
  final Function(ArticleCategoryEntity category, bool isChecked)?
      onCategoryChanged;

  const WidgetFilterItem({
    Key? key,
    required this.category,
    this.onCategoryChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (category == null) {
      return Container();
    }

    return GestureDetector(
      onTap: _categoryPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                category!.name,
                style: Style.regular_16,
              ),
            ),
            category!.isChecked
                ? Assets.images.check.image()
                : Assets.images.unselected.image()
          ],
        ),
      ),
    );
  }

  void _categoryPressed() {
    if (onCategoryChanged != null && category != null) {
      onCategoryChanged!(category!, !category!.isChecked);
    }
  }
}
