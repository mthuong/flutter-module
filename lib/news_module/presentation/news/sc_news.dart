import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_cross_platform/app/router.dart';
import 'package:mobile_cross_platform/gen/assets.gen.dart';
import 'package:mobile_cross_platform/news_module/presentation/filter_news/bloc/filter_news_bloc.dart';
import 'package:mobile_cross_platform/news_module/presentation/news/bloc/news_bloc.dart';
import 'package:mobile_cross_platform/news_module/presentation/news/widgets/widget_badge.dart';
import 'package:mobile_cross_platform/news_module/presentation/news/widgets/widget_list_article.dart';
import 'package:mobile_cross_platform/news_module/presentation/widgets/widget_loading.dart';
import 'package:mobile_cross_platform/news_module/presentation/widgets/widgets.dart';
import 'package:mobile_cross_platform/theme/fonts.dart';
import 'package:mobile_cross_platform/theme/theme.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Text(
              AppLocalizations.of(context)!.news,
              style: Style.semibold,
            ),
            centerTitle: true,
            actions: [
              BlocBuilder<FilterNewsBloc, FilterNewsState>(
                builder: (context, state) {
                  return WidgetBadge(
                    badge: state.numberOfFilter,
                  );
                },
              ),
              IconButton(
                onPressed: () {
                  _filterAction(context);
                },
                icon: Assets.images.filter.image(
                  color: Theme.of(context).own().colors.coinBlueTitle,
                ),
              )
            ],
          ),
          body: Container(
            color: Colors.white,
            child: _buildContent(context, state),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, NewsState state) {
    if (state.status == NewsStatus.success) {
      return RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<NewsBloc>(context).add(RefreshNews());
        },
        child: WidgetListArticle(
          items: state.articles,
        ),
      );
    } else if (state.status == NewsStatus.loading) {
      return const WidgetLoading();
    } else if (state.status == NewsStatus.initial) {
      return const WidgetLoading();
    } else {
      return const Expanded(
        child: Center(
          child: Text('Cannot load data'),
        ),
      );
    }
  }

  void _filterAction(BuildContext context) {
    BlocProvider.of<FilterNewsBloc>(context).add(FetchFilterNews());
    Navigator.of(context).pushNamed(AppRouter.newsFilter);
  }
}
