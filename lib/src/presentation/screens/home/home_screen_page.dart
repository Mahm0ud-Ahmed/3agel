import 'package:aagel/src/core/config/themes/dark_theme.dart';
import 'package:aagel/src/core/services/setting_service.dart';
import 'package:aagel/src/core/services/storage_service.dart';
import 'package:aagel/src/core/utils/query_params.dart';
import 'package:aagel/src/data/models/article_model.dart';
import 'package:aagel/src/presentation/blocs/api_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';


class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  ApiDataBloc<ArticleModel> bloc = ApiDataBloc(query: QueryParams(category: 'general', pageSize: 5), maxResult: 5);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiDataBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: PagedListView(
            pagingController: bloc.controller, 
            builderDelegate: PagedChildBuilderDelegate<ArticleModel> (
              itemBuilder: (context, item, index) {
                return Text(item.title.toString());
              },
            ),
          )
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async{
          await StorageService().saveBool('mode', true);
          SettingService().changeThemeMode(DarkTheme());
        }),
      ),
    );
  }
}