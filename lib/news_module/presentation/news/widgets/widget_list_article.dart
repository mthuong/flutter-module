import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_cross_platform/app/router.dart';
import 'package:mobile_cross_platform/gen/assets.gen.dart';
import 'package:mobile_cross_platform/news_module/presentation/news/bloc/news_bloc.dart';
import 'package:mobile_cross_platform/news_module/presentation/widgets/widget_default_loading.dart';
import 'package:mobile_cross_platform/news_module/presentation/widgets/widget_empty.dart';
import 'package:mobile_cross_platform/news_module/presentation/widgets/widget_separator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:mobile_cross_platform/news_module/presentation/widgets/widget_spacer.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_entity.dart';
import 'package:mobile_cross_platform/theme/fonts.dart';
import 'package:mobile_cross_platform/theme/theme.dart';

class WidgetListArticle extends StatefulWidget {
  final List<ArticleEntity> items;
  final bool hasReachedMax;

  const WidgetListArticle({
    Key? key,
    required this.items,
    required this.hasReachedMax,
  }) : super(key: key);

  @override
  _WidgetListArticleState createState() => _WidgetListArticleState();
}

class _WidgetListArticleState extends State<WidgetListArticle> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty && widget.hasReachedMax == true) {
      // Render empty view
      return WidgetEmpty(
        image: Assets.images.icNewsEmpty.image(
          fit: BoxFit.contain,
        ),
        title: AppLocalizations.of(context)!.no_news_yet,
        description: AppLocalizations.of(context)!.no_news_desc,
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        // Load more indicator
        if (index >= widget.items.length) {
          return const WidgetDefaultLoading();
        }

        final article = widget.items[index];
        if (index == 0) {
          return _ItemWidgetHighlightArticle(article: article);
        }
        return _ItemWidgetArticle(article: article);
      },
      separatorBuilder: (context, index) {
        return const WidgetSeparator(
          height: 1,
        );
      },
      itemCount: _itemCount(),
      controller: _scrollController,
    );
  }

  int _itemCount() {
    return widget.hasReachedMax ? widget.items.length : widget.items.length + 1;
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<NewsBloc>().add(LoadNews());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class _ItemWidgetArticle extends StatelessWidget {
  final ArticleEntity article;

  const _ItemWidgetArticle({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AppRouter.newsDetail, arguments: article);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding: const EdgeInsets.only(
                        right: 4,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              article.title,
                              style: Style.semibold_16,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '${article.timeAgo} ??? ${article.source}',
                            style: Style.regular.copyWith(
                              color:
                                  Theme.of(context).own().colors.coinSlateGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: CachedNetworkImage(
                          placeholder: (context, url) => Assets
                              .images.icNewsDefault
                              .image(fit: BoxFit.fill),
                          imageUrl: article.banner ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const WidgetSpacer(
              height: 8,
            ),
            // Link
            Text(
              article.link ?? '',
              style: Style.regular.copyWith(
                color: Theme.of(context).own().colors.coinSlateGray,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            )
          ],
        ),
      ),
    );
  }
}

class _ItemWidgetHighlightArticle extends StatelessWidget {
  final ArticleEntity article;

  const _ItemWidgetHighlightArticle({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AppRouter.newsDetail, arguments: article);
      },
      child: Stack(
        alignment: const Alignment(0.5, 1),
        children: [
          CachedNetworkImage(
            placeholder: (context, url) =>
                Assets.images.icNewsDefault.image(fit: BoxFit.cover),
            imageUrl: article.banner ?? '',
            fit: BoxFit.cover,
            placeholderFadeInDuration: const Duration(seconds: 1),
            errorWidget: (context, url, error) =>
                Assets.images.icNewsDefault.image(fit: BoxFit.cover),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: Style.semibold_22.copyWith(
                    color: Colors.white,
                    shadows: [
                      const BoxShadow(
                        color: Colors.black,
                        // spreadRadius: 10,
                        blurRadius: 10,
                        offset: Offset.zero,
                      ),
                    ],
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const WidgetSpacer(
                  height: 8,
                ),
                Text(
                  '${article.timeAgo} ??? ${article.source}',
                  style: Style.regular.copyWith(
                    color: Colors.white,
                    shadows: [
                      const BoxShadow(
                        color: Colors.black,
                        // spreadRadius: 10,
                        blurRadius: 10,
                        offset: Offset.zero,
                      ),
                    ],
                  ),
                ),
                const WidgetSpacer(
                  height: 8,
                ),
                // Link
                Text(
                  article.link ?? '',
                  style: Style.regular.copyWith(
                    color: Colors.white,
                    shadows: [
                      const BoxShadow(
                        color: Colors.black,
                        // spreadRadius: 10,
                        blurRadius: 10,
                        offset: Offset.zero,
                      ),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
