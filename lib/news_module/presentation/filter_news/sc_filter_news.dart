import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_cross_platform/news_module/presentation/filter_news/widgets/widget_filter_item.dart';
import 'package:mobile_cross_platform/news_module/presentation/widgets/widget_nav_title.dart';
import 'package:mobile_cross_platform/news_module/presentation/widgets/widget_unknown_state.dart';
import 'package:mobile_cross_platform/news_module/presentation/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_category.dart';
import 'package:mobile_cross_platform/theme/fonts.dart';

import 'bloc/filter_news_bloc.dart';

class FilterNewsScreen extends StatelessWidget {
  const FilterNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuilder(context),
      body: BlocListener<FilterNewsBloc, FilterNewsState>(
        listener: (context, state) {
          if (state.status == FilterNewsStatus.updatedFilterSuccess) {
            Navigator.of(context).pop();
          }
        },
        child: BlocBuilder<FilterNewsBloc, FilterNewsState>(
          builder: (context, state) {
            switch (state.status) {
              case FilterNewsStatus.initial:
              case FilterNewsStatus.loading:
                return const WidgetLoading();

              case FilterNewsStatus.confirmingUpdateStatus:
                return Stack(
                  children: [
                    _listBuilder(context, state),
                    const WidgetLoading(),
                  ],
                );
              case FilterNewsStatus.success:
                return _listBuilder(context, state);

              case FilterNewsStatus.failure:

              default:
            }

            return const WidgetUnknownState();
          },
        ),
      ),
    );
  }

  AppBar _appBarBuilder(BuildContext context) {
    return AppBar(
      leading: TextButton(
        onPressed: () {
          _onDone(context);
        },
        child: Text(
          AppLocalizations.of(context)!.done,
          style: Style.regular_16,
        ),
      ),
      title: WidgetNavTitle(
        title: AppLocalizations.of(context)!.filter,
      ),
      actions: [
        TextButton(
          onPressed: () {
            _onClear(context);
          },
          child: Text(
            AppLocalizations.of(context)!.clear,
            style: Style.regular_16,
          ),
        )
      ],
    );
  }

  void _onDone(BuildContext context) {
    // Call update filter api
    final bloc = BlocProvider.of<FilterNewsBloc>(context);
    bloc.add(ConfirmUpdateFilterEvent());
  }

  void _onClear(BuildContext context) {
    // Clear all selected item
    final bloc = BlocProvider.of<FilterNewsBloc>(context);
    bloc.add(ClearFilterEvent());
  }

  Widget _listBuilder(BuildContext context, FilterNewsState state) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return _itemBuilder(context, index, state);
      },
      separatorBuilder: _separatorBuilder,
      itemCount: state.categories.length,
    );
  }

  Widget _itemBuilder(BuildContext context, int index, FilterNewsState state) {
    try {
      final category = state.categories[index];
      return WidgetFilterItem(
        category: category,
        onCategoryChanged: (category, isChecked) {
          _onCategoryChanged(context, category, isChecked);
        },
      );
    } catch (e) {
      log('_itemBuilder ${e.toString()}');
      return Container();
    }
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return const WidgetSeparator();
  }

  void _onCategoryChanged(
    BuildContext context,
    ArticleCategoryEntity category,
    bool isChecked,
  ) {
    final bloc = BlocProvider.of<FilterNewsBloc>(context);
    bloc.add(
      UpdateFilterStatus(
        category: category.copyWith(isChecked: isChecked),
      ),
    );
  }
}
