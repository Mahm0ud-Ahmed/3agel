import 'package:aagel/src/core/config/themes/theme_manager.dart';
import 'package:aagel/src/presentation/widgets/custom_container_with_icon.dart';
import 'package:aagel/src/presentation/widgets/generic_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'component/header_search_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // ApiDataBloc<ArticleModel> bloc = ApiDataBloc(query: QueryParams(category: 'general', pageSize: 5), maxResult: 5)..add(ApiDataPagination());

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HeaderSearchWidget(),
        ),
      ],
    );
  }
}
