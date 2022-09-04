import 'dart:async';

import 'package:flutter/material.dart';
import '../../../../../core/utils/query_params.dart';
import '../../../../../data/models/article_model.dart';
import '../../../../controllers/data_bloc/api_data_bloc.dart';
import 'widget/header_search_widget.dart';
import 'widget/search_body_widget.dart';

class SearchPage extends StatefulWidget {
  bool isSearch;

  SearchPage({super.key, this.isSearch = false});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final QueryParams _query = QueryParams(pageSize: 10);
  late ApiDataBloc<ArticleModel> _searchBloc;
  Timer? _debounce;

  String? currentSearch;

  late final ValueNotifier<bool> _notifier;

  @override
  void initState() {
    super.initState();
    widget.isSearch = false;
    _notifier = ValueNotifier<bool>(widget.isSearch);
    // _query = QueryParams(pageSize: 10);
    _searchBloc = ApiDataBloc<ArticleModel>(query: _query, maxResult: 50);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  executeSearch(String? searchValue) {
    String? temp = searchValue?.trim();

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      if ((temp != null && temp.isNotEmpty && temp.length > 1) &&
          currentSearch != temp) {
        currentSearch = temp;
        _query.queryWord = temp;
        _notifier.value = widget.isSearch = true;
        _searchBloc.controller.refresh();
      } else if (temp == null || temp.isEmpty) {
        _notifier.value = widget.isSearch = false;
        currentSearch = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: HeaderSearchWidget(
            onChange: executeSearch,
            onTab: () {
              if (currentSearch != null && currentSearch!.isNotEmpty) {
                _notifier.value = widget.isSearch = true;
                _searchBloc.controller.refresh();
              }
            },
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          sliver: SliverFillViewport(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) {
                return SearchBodyWidget(
                  notifier: _notifier,
                  searchBloc: _searchBloc,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
