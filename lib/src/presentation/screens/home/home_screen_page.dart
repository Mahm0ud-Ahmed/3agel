import 'package:aagel/src/core/config/themes/dark_theme.dart';
import 'package:aagel/src/core/config/themes/theme_manager.dart';
import 'package:aagel/src/core/services/setting_service.dart';
import 'package:aagel/src/core/services/storage_service.dart';
import 'package:aagel/src/core/utils/query_params.dart';
import 'package:aagel/src/data/models/article_model.dart';
import 'package:aagel/src/presentation/blocs/api_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../core/config/themes/light_theme.dart';
import '../../../data/models/api_pagination_model.dart';


class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  ApiDataBloc<ArticleModel> bloc = ApiDataBloc(query: QueryParams(category: 'general', pageSize: 5), maxResult: 5)..add(ApiDataPagination());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiDataBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            /* if(state is ApiDataLoaded<ApiPaginationModel<ArticleModel>>) {
              return Center(
              child: Text(state.data!.data!.length.toString()),
                  
                  /* PagedListView(
                    pagingController: bloc.controller, 
                    builderDelegate: PagedChildBuilderDelegate<ArticleModel> (
                      itemBuilder: (context, item, index) {
                        return Text(item.title.toString());
                      },
                    ),
                  ) */
                );
            } */
            return FloatingActionButton(onPressed: () async{
          await StorageService().saveBool('mode', false);
          ThemeManager().changeThemeMode(LightTheme());
        });
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async{
          await StorageService().saveBool('mode', true);
          ThemeManager().changeThemeMode(DarkTheme());
        }),
      ),
    );
  }
}