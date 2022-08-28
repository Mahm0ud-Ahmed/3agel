import 'package:flutter/material.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/query_params.dart';
import '../../../../../data/models/article_model.dart';
import '../../../../controllers/data_bloc/api_data_bloc.dart';
import '../latest/widget/category_news_list_widget.dart';
import '../latest/widget/category_news_widget.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late final ApiDataBloc<ArticleModel> _articleBloc;
  late final ValueNotifier<NewsCategory> _categoryListen;

  final QueryParams _query = QueryParams(
    category: NewsCategory.business.category,
  );

  @override
  void initState() {
    super.initState();

    _articleBloc = ApiDataBloc(query: _query, maxResult: 20);
    _categoryListen = ValueNotifier(NewsCategory.business);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _articleBloc.controller.refresh();
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            sliver: SliverToBoxAdapter(
              child: CategoryNewsWidget(
                onTab: updateListeners,
                categoryListen: _categoryListen,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: CategoryNewsList(articleBloc: _articleBloc),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
            ),
          ),
        ],
      ),
    );
  }

  void updateListeners(NewsCategory newCategory) {
    if (newCategory != _categoryListen.value &&
        newCategory.category != _query.category) {
      _categoryListen.value = newCategory;
      _query.category = newCategory.category;
      _articleBloc.controller.refresh();
    }
  }
}
