import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:mobile_cross_platform/gen/assets.gen.dart';
import 'package:mobile_cross_platform/news_module/channel/news_channel.dart';
import 'package:mobile_cross_platform/news_module/presentation/widgets/widgets.dart';
import 'package:mobile_cross_platform/news_module/repositories/article/core/article_entity.dart';
import 'package:mobile_cross_platform/theme/fonts.dart';
import 'package:mobile_cross_platform/theme/theme.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum MenuType { shareArticle, openBrowser }

class NewsDetailScreen extends StatefulWidget {
  final ArticleEntity article;

  const NewsDetailScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  void initState() {
    super.initState();

    // Hide bottom bar
    NewsPlatformChannel.platform.invokeMethod(NewsPlatformMethod.hideBottomBar);
  }

  @override
  Widget build(BuildContext context) {
    final article = widget.article;
    final appBarDefaultHeight = AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        leading: const WidgetBackButton(),
        actions: [
          IconButton(
            onPressed: _shareAction,
            icon: Assets.images.icNewsShare.image(
              width: 24,
              height: 24,
            ),
          ),
          PopupMenuButton<MenuType>(
            icon: Assets.images.icNewsSetting.image(
              width: 24,
              height: 24,
            ),
            itemBuilder: (context) {
              return <PopupMenuEntry<MenuType>>[
                PopupMenuItem(
                  child: Row(
                    children: [
                      Assets.images.icNewsShare.image(
                        width: 24,
                        height: 24,
                      ),
                      const WidgetSpacer(
                        width: 16,
                      ),
                      Text(AppLocalizations.of(context)!.share_article)
                    ],
                  ),
                  value: MenuType.shareArticle,
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Assets.images.icNewsBrowser.image(
                        width: 24,
                        height: 24,
                      ),
                      const WidgetSpacer(
                        width: 16,
                      ),
                      Text(AppLocalizations.of(context)!.open_in_browser)
                    ],
                  ),
                  value: MenuType.openBrowser,
                ),
              ];
            },
            offset: Offset(0, appBarDefaultHeight),
            onSelected: _settingAction,
          ),
        ],
      ),
      body: Column(
        children: [
          Image.network(
            article.banner ?? '',
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: Style.semibold_22,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const WidgetSpacer(
                  height: 8,
                ),
                Text(
                  '${article.timeAgo} • ${article.source}',
                  style: Style.regular.copyWith(
                    color: Theme.of(context).own().colors.coinSlateGray,
                  ),
                ),
                const WidgetSpacer(
                  height: 8,
                ),
                // Link
                RichText(
                  text: TextSpan(
                    style: Style.regular.copyWith(
                      color: Theme.of(context).own().colors.coinLink,
                      decoration: TextDecoration.underline,
                    ),
                    text: article.link ?? '',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        await _openArticle();
                      },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openArticle() async {
    final url = widget.article.link;
    if (url != null) {
      if (Platform.isIOS) {
        // Host iOS app can not open web launcher flutter because of weird iOS view hierarchy
        NewsPlatformChannel.platform
            .invokeMethod(NewsPlatformMethod.openBrowser, url);
      } else {
        await launcher.launch(
          url,
          forceWebView: true,
        );
      }
    }
  }

  void _shareAction() {
    final url = widget.article.link;
    if (url != null) {
      Share.share(url);
    }
  }

  void _settingAction(MenuType type) {
    switch (type) {
      case MenuType.shareArticle:
        _shareAction();
        break;

      case MenuType.openBrowser:
        _openArticle();
        break;

      default:
    }
  }

  @override
  void dispose() {
    // Show bottom bar
    NewsPlatformChannel.platform.invokeMethod(NewsPlatformMethod.showBottomBar);

    super.dispose();
  }
}
