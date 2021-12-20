import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_cross_platform/news_module/presentation/news/bloc/news_bloc.dart';
import 'package:mobile_cross_platform/news_module/presentation/news/widgets/widget_list_article.dart';
import 'package:mobile_cross_platform/news_module/presentation/widgets/widget_loading.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    // Load news
    BlocProvider.of<NewsBloc>(context).add(LoadNews());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.news),
            ),
            body: Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _buildContent(state),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(NewsState state) {
    if (state is NewsLoaded) {
      return Expanded(
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<NewsBloc>(context).add(RefreshNews());
          },
          child: WidgetListArticle(
            items: state.articles,
          ),
        ),
      );
    } else if (state is NewsLoading) {
      return const WidgetLoading();
    } else {
      return const Expanded(
        child: Center(
          child: Text('Cannot load data'),
        ),
      );
    }
  }
}
