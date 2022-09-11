import 'package:aagel/src/presentation/controllers/navigation_bar_controller.dart';
import 'package:aagel/src/presentation/controllers/search_controller.dart';
import 'package:aagel/src/presentation/screens/home/pages/bookmark/bookmark_page.dart';
import 'package:aagel/src/presentation/screens/home/pages/latest/latest_page.dart';
import 'package:aagel/src/presentation/screens/home/pages/news/news_page.dart';
import 'package:aagel/src/presentation/screens/home/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/bottom_nav_bar_widget.dart';
import 'pages/settings/settings_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  final List<Widget> pages = const <Widget>[
    LatestPage(),
    SearchPage(),
    BookmarkPage(),
    NewsPage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBarController>(
            create: (context) => NavigationBarController()),
        BlocProvider<SearchController>(
            create: (context) => SearchController()),
      ],
      child: Scaffold(
        extendBody: true,
        // appBar:  PreferredSize(
        //   preferredSize: const Size(double.infinity, 56),
        //   child: MyAppBarWidget(),
        // ),
        body: SafeArea(
          child: BlocBuilder<NavigationBarController, int>(
            builder: (context, state) {
              return pages[state];
            },
          ),
        ),
        bottomNavigationBar:  BottomNavBarWidget(),
      ),
    );
  }
}
