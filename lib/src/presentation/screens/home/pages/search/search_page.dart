import 'dart:async';

import 'package:aagel/src/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/config/themes/theme_manager.dart';
import '../../../../../core/utils/query_params.dart';
import '../../../../../data/models/article_model.dart';
import '../../../../controllers/data_bloc/api_data_bloc.dart';
import '../../../../controllers/search_controller.dart';
import '../../../../controllers/search_model.dart';
import '../../../../widgets/header_search_widget.dart';
import 'widget/search_body_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final QueryParams _query = QueryParams(pageSize: 10);
  late ApiDataBloc<ArticleModel> _searchBloc;
  late final ValueNotifier<bool> _searchNotifier;
  late final ValueNotifier<NewsCategory?> _categoryNotifier;

  late bool isSearch;
  Timer? _debounce;

  String? _currentSearch;
  String? _searchCategory;

  @override
  void initState() {
    super.initState();
    isSearch = false;
    _searchNotifier = ValueNotifier<bool>(isSearch);
    _categoryNotifier = ValueNotifier<NewsCategory?>(null);
    _searchBloc = ApiDataBloc<ArticleModel>(query: _query, maxResult: 50);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          titleSpacing: 0,
          pinned: true,
          snap: false,
          floating: false,
          // elevation: 2,
          shadowColor: ThemeManager().appColor[2],
          title: BlocBuilder<SearchController, SearchModel>(
            builder: (context, state) {
              if (state.searchCharacter != null) {
                if (state.category != null) {
                  setCategory(state.category);
                }
                preparingSearchData(state.searchCharacter);
              }
              return HeaderSearchWidget(
                initialValue: state.searchCharacter,
                onChange: executeSearch,
                onChoose: setCategory,
                categoryNotifier: _categoryNotifier,
                onTab: () => preparingSearchData(_currentSearch),
              );
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
                  notifier: _searchNotifier,
                  searchBloc: _searchBloc,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  executeSearch(String? searchValue) {
    String? newSearchValue = searchValue?.trim();

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      if ((newSearchValue != null &&
              newSearchValue.isNotEmpty &&
              newSearchValue.length > 1) &&
          (_currentSearch != newSearchValue)) {
        preparingSearchData(newSearchValue);
      } else if (_searchCategory != _categoryNotifier.value?.category) {
        preparingSearchData(newSearchValue);
      } else if (newSearchValue == null || newSearchValue.isEmpty) {
        preparingSearchData(newSearchValue);
      }
    });
  }

  setCategory(NewsCategory? newCategorySearch) {
    if ((_searchCategory != newCategorySearch?.category) &&
        (_currentSearch != null && _currentSearch!.isNotEmpty)) {
      _query.category = newCategorySearch?.category;
      _searchBloc.controller.refresh();
    }
    _categoryNotifier.value = newCategorySearch;
    _searchCategory = newCategorySearch?.category;
  }

  preparingSearchData(String? newSearchValue) {
    if (newSearchValue != null && newSearchValue.isNotEmpty) {
      _currentSearch = newSearchValue;
      _query.queryWord = newSearchValue;
      if (_categoryNotifier.value != null) {
        _query.category = _categoryNotifier.value?.category;
      } else {
        _query.category = null;
      }
      _searchNotifier.value = isSearch = true;
      _searchBloc.controller.refresh();
    } else {
      _searchNotifier.value = isSearch = false;
      _categoryNotifier.value = null;
      _searchCategory = null;
      _currentSearch = null;
    }
  }
}
