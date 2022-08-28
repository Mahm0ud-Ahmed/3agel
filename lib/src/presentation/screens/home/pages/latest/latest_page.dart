import 'package:flutter/material.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/query_params.dart';
import '../../../../../data/models/article_model.dart';
import '../../../../controllers/data_bloc/api_data_bloc.dart';
import 'widget/carousel_header_widget.dart';
import 'widget/category_news_list_widget.dart';
import 'widget/category_news_widget.dart';

class LatestPage extends StatefulWidget {
  const LatestPage({super.key});

  @override
  State<LatestPage> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {
  late final ApiDataBloc<ArticleModel> _carouselBloc;
  late final ApiDataBloc<ArticleModel> _articleBloc;
  late final ValueNotifier<NewsCategory> _categoryListen;

  final QueryParams _query = QueryParams(
    category: NewsCategory.business.category,
    pageSize: 10,
  );

  @override
  void initState() {
    super.initState();
    _carouselBloc = ApiDataBloc(
        query: QueryParams(category: 'general', pageSize: 5), maxResult: 5)
      ..add(ApiDataPagination());

    _articleBloc = ApiDataBloc(maxResult: 10, query: _query);
    _categoryListen = ValueNotifier(NewsCategory.business);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _carouselBloc.add(ApiDataPagination());
        _articleBloc.controller.refresh();
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: CarouselHeaderWidget(carouselBloc: _carouselBloc),
          ),
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
