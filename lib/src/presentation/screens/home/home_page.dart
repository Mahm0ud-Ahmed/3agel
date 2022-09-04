import 'package:aagel/src/presentation/controllers/navigation_bar_controller.dart';
import 'package:aagel/src/presentation/screens/home/pages/bookmark/bookmark_page.dart';
import 'package:aagel/src/presentation/screens/home/pages/latest/latest_page.dart';
import 'package:aagel/src/presentation/screens/home/pages/news/news_page.dart';
import 'package:aagel/src/presentation/screens/home/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/bottom_nav_bar_widget.dart';
import '../../widgets/my_app_bar_widget.dart';
import 'pages/settings/settings_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {

  final List<Widget> pages = <Widget>[
    const LatestPage(),
    SearchPage(),
    const BookmarkPage(),
    const NewsPage(),
    const SettingsPage()
  ];

  HomePage({
    super.key,
  });

  // ApiDataBloc<ArticleModel> bloc = ApiDataBloc(query: QueryParams(category: 'general', pageSize: 5), maxResult: 5)..add(ApiDataPagination());
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBarController>(
      create: (context) => NavigationBarController(),
      child: Scaffold(
        extendBody: true,
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 56),
          child: MyAppBarWidget(),
        ),
        body: BlocBuilder<NavigationBarController, int>(
          builder: (context, state) {
            return pages[state];
          },
        ),
        bottomNavigationBar: const BottomNavBarWidget(),
      ),
    );
  }
}